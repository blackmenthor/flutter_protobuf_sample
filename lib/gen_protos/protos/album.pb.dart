///
//  Generated code. Do not modify.
//  source: protos/album.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ListOfAlbums_Album extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListOfAlbums.Album', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'publish'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'artist')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'price', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  ListOfAlbums_Album._() : super();
  factory ListOfAlbums_Album({
    $core.String? id,
    $core.String? title,
    $core.String? artist,
    $core.double? price,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (title != null) {
      _result.title = title;
    }
    if (artist != null) {
      _result.artist = artist;
    }
    if (price != null) {
      _result.price = price;
    }
    return _result;
  }
  factory ListOfAlbums_Album.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListOfAlbums_Album.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListOfAlbums_Album clone() => ListOfAlbums_Album()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListOfAlbums_Album copyWith(void Function(ListOfAlbums_Album) updates) => super.copyWith((message) => updates(message as ListOfAlbums_Album)) as ListOfAlbums_Album; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListOfAlbums_Album create() => ListOfAlbums_Album._();
  ListOfAlbums_Album createEmptyInstance() => create();
  static $pb.PbList<ListOfAlbums_Album> createRepeated() => $pb.PbList<ListOfAlbums_Album>();
  @$core.pragma('dart2js:noInline')
  static ListOfAlbums_Album getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListOfAlbums_Album>(create);
  static ListOfAlbums_Album? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get artist => $_getSZ(2);
  @$pb.TagNumber(3)
  set artist($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasArtist() => $_has(2);
  @$pb.TagNumber(3)
  void clearArtist() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get price => $_getN(3);
  @$pb.TagNumber(4)
  set price($core.double v) { $_setFloat(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrice() => clearField(4);
}

class ListOfAlbums extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListOfAlbums', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'publish'), createEmptyInstance: create)
    ..pc<ListOfAlbums_Album>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'albums', $pb.PbFieldType.PM, subBuilder: ListOfAlbums_Album.create)
    ..hasRequiredFields = false
  ;

  ListOfAlbums._() : super();
  factory ListOfAlbums({
    $core.Iterable<ListOfAlbums_Album>? albums,
  }) {
    final _result = create();
    if (albums != null) {
      _result.albums.addAll(albums);
    }
    return _result;
  }
  factory ListOfAlbums.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListOfAlbums.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListOfAlbums clone() => ListOfAlbums()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListOfAlbums copyWith(void Function(ListOfAlbums) updates) => super.copyWith((message) => updates(message as ListOfAlbums)) as ListOfAlbums; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListOfAlbums create() => ListOfAlbums._();
  ListOfAlbums createEmptyInstance() => create();
  static $pb.PbList<ListOfAlbums> createRepeated() => $pb.PbList<ListOfAlbums>();
  @$core.pragma('dart2js:noInline')
  static ListOfAlbums getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListOfAlbums>(create);
  static ListOfAlbums? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ListOfAlbums_Album> get albums => $_getList(0);
}

