
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_protobuf_sample/app.dart';
import 'package:flutter_protobuf_sample/gen_protos/protos/album.pb.dart';
import 'package:flutter_protobuf_sample/models/album.dart';
import 'package:flutter_protobuf_sample/utils.dart';

class LocalDataPage extends StatefulWidget {
  const LocalDataPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LocalDataPage> createState() => _LocalDataPageState();
}

class _LocalDataPageState extends State<LocalDataPage> {
  List<Album>? _albums;
  dynamic _error;

  int? _dataSizeInBytes;
  Duration? _fetchDuration;

  bool get isLoading => _error == null && _albums == null;
  String get errorText => _error.toString();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _fetchData();
    });
  }

  Future<void> _fetchData() async {
    try {
      final before = DateTime.now();

      final file = await getFromFile();
      final Uint8List result = await file.readAsBytes();

      _dataSizeInBytes = await file.length();

      final albums = ListOfAlbums.fromBuffer(result);

      final after = DateTime.now();
      final delta = after.difference(before);
      _fetchDuration = delta;

      final ret = <Album>[];
      for (final item in albums.albums) {
        final album = Album(
          id: item.id,
          title: item.title,
          price: item.price,
          artist: item.artist,
        );
        ret.add(album);
      }
      _albums = ret;
    } catch (ex) {
      print(ex.toString());
      _error = ex;
    } finally {
      if (mounted) {
        setState(() {});
      }
    }
  }

  Widget _buildBody(BuildContext context) {
    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            errorText,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          color: Colors.redAccent,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Duration to fetch: ${_fetchDuration!.inMilliseconds} ms',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Response size: ${_dataSizeInBytes!
                        .toByte(2)} bytes',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: _albums!.length,
              itemBuilder: (context, index) {
                final item = _albums![index];
                return ListTile(
                  leading: Text(
                    item.id,
                  ),
                  title: Text(
                    item.title,
                  ),
                  trailing: Text(
                    item.price.toStringAsFixed(2),
                  ),
                );
              },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Local File w/ Protobuf page',
        ),
      ),
      body: _buildBody(context),
    );
  }
}
