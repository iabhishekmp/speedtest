//
//  Generated code. Do not modify.
//  source: speedtest.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class FileSize extends $pb.ProtobufEnum {
  static const FileSize MB1 = FileSize._(0, _omitEnumNames ? '' : 'MB1');
  static const FileSize MB25 = FileSize._(1, _omitEnumNames ? '' : 'MB25');

  static const $core.List<FileSize> values = <FileSize> [
    MB1,
    MB25,
  ];

  static final $core.Map<$core.int, FileSize> _byValue = $pb.ProtobufEnum.initByValue(values);
  static FileSize? valueOf($core.int value) => _byValue[value];

  const FileSize._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
