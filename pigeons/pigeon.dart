import 'package:pigeon/pigeon.dart';

class AlbumA {
  String? id;
  String? title;
  String? artist;
  double? price;
}

@HostApi()
abstract class AlbumApi {
  List<AlbumA?> getAlbum();
}