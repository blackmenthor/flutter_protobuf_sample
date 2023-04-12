import 'package:flutter/material.dart';
import 'package:flutter_protobuf_sample/constants.dart';
import 'package:flutter_protobuf_sample/gen_protos/protos/album.pb.dart';
import 'package:flutter_protobuf_sample/utils.dart';
import 'package:http/http.dart' as http;

class ProtobufPage extends StatefulWidget {
  const ProtobufPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProtobufPage> createState() => _ProtobufPageState();
}

class _ProtobufPageState extends State<ProtobufPage> {
  List<ListOfAlbums_Album>? _albums;
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

      var url = Uri.http(
          Constants.serverUrl,
          'proto-2/albums/',
      );
      var resp = await http.get(url);

      _dataSizeInBytes = resp.contentLength ?? 0;
      final after = DateTime.now();
      final delta = after.difference(before);
      _fetchDuration = delta;

      ListOfAlbums listOfAlbums = ListOfAlbums.fromBuffer(resp.bodyBytes);

      _albums = listOfAlbums.albums;
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
          'Protobuf page',
        ),
      ),
      body: _buildBody(context),
    );
  }
}
