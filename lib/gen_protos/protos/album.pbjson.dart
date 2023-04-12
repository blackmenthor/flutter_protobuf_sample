///
//  Generated code. Do not modify.
//  source: protos/album.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use listOfAlbumsDescriptor instead')
const ListOfAlbums$json = const {
  '1': 'ListOfAlbums',
  '2': const [
    const {'1': 'albums', '3': 1, '4': 3, '5': 11, '6': '.publish.ListOfAlbums.Album', '10': 'albums'},
  ],
  '3': const [ListOfAlbums_Album$json],
};

@$core.Deprecated('Use listOfAlbumsDescriptor instead')
const ListOfAlbums_Album$json = const {
  '1': 'Album',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'artist', '3': 3, '4': 1, '5': 9, '10': 'artist'},
    const {'1': 'price', '3': 4, '4': 1, '5': 2, '10': 'price'},
  ],
};

/// Descriptor for `ListOfAlbums`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listOfAlbumsDescriptor = $convert.base64Decode('CgxMaXN0T2ZBbGJ1bXMSMwoGYWxidW1zGAEgAygLMhsucHVibGlzaC5MaXN0T2ZBbGJ1bXMuQWxidW1SBmFsYnVtcxpbCgVBbGJ1bRIOCgJpZBgBIAEoCVICaWQSFAoFdGl0bGUYAiABKAlSBXRpdGxlEhYKBmFydGlzdBgDIAEoCVIGYXJ0aXN0EhQKBXByaWNlGAQgASgCUgVwcmljZQ==');
