import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_protobuf_sample/gen_protos/protos/album.pb.dart';
import 'package:flutter_protobuf_sample/home_page.dart';
import 'package:path_provider/path_provider.dart';

const fileName = 'file_01.tmp';
const fileNameJson = 'file_02.tmp';

Future<File> writeJsonToFile(ListOfAlbums data) async {
  final json = data.writeToJson();
  Directory tempDir = await getTemporaryDirectory();
  String tempPath = tempDir.path;

  var filePath = tempPath + fileNameJson;

  return File(filePath)
      .writeAsBytes(json.codeUnits);
}

Future<File> writeToFile(Uint8List data) async {
  final buffer = data.buffer;
  Directory tempDir = await getTemporaryDirectory();
  String tempPath = tempDir.path;

  var filePath = tempPath + fileName;

  return File(filePath)
      .writeAsBytes(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
}

Future<File> getFromFile() async {
  Directory tempDir = await getTemporaryDirectory();
  String tempPath = tempDir.path;
  var filePath = tempPath + fileName;

  return File(filePath);
}

Future<File> getJsonFromFile() async {
  Directory tempDir = await getTemporaryDirectory();
  String tempPath = tempDir.path;
  var filePath = tempPath + fileNameJson;

  return File(filePath);
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _saveToFile();
    });
  }

  Future<void> _saveToFile() async {
    final albums = ListOfAlbums();

    for (var i = 0; i<100000; i++) {
      albums.albums.add(
        ListOfAlbums_Album(
          id: 'ID_$i',
          title: 'ALBUM $i',
          artist: 'ARTIST $i',
          price: 100,
        ),
      );
    }

    await writeToFile(albums.writeToBuffer());
    await writeJsonToFile(albums);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
