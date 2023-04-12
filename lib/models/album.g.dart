// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Album _$$_AlbumFromJson(Map<String, dynamic> json) => _$_Album(
      id: json['id'] as String,
      title: json['title'] as String,
      artist: json['artist'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$_AlbumToJson(_$_Album instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'artist': instance.artist,
      'price': instance.price,
    };
