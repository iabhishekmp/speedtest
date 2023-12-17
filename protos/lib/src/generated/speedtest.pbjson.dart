//
//  Generated code. Do not modify.
//  source: speedtest.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use downloadRequestDescriptor instead')
const DownloadRequest$json = {
  '1': 'DownloadRequest',
  '2': [
    {'1': 'chunkSize', '3': 1, '4': 1, '5': 5, '10': 'chunkSize'},
    {'1': 'totalSize', '3': 2, '4': 1, '5': 5, '10': 'totalSize'},
  ],
};

/// Descriptor for `DownloadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloadRequestDescriptor = $convert.base64Decode(
    'Cg9Eb3dubG9hZFJlcXVlc3QSHAoJY2h1bmtTaXplGAEgASgFUgljaHVua1NpemUSHAoJdG90YW'
    'xTaXplGAIgASgFUgl0b3RhbFNpemU=');

@$core.Deprecated('Use downloadDataDescriptor instead')
const DownloadData$json = {
  '1': 'DownloadData',
  '2': [
    {'1': 'data', '3': 1, '4': 1, '5': 12, '10': 'data'},
    {'1': 'progress', '3': 2, '4': 1, '5': 1, '10': 'progress'},
  ],
};

/// Descriptor for `DownloadData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloadDataDescriptor = $convert.base64Decode(
    'CgxEb3dubG9hZERhdGESEgoEZGF0YRgBIAEoDFIEZGF0YRIaCghwcm9ncmVzcxgCIAEoAVIIcH'
    'JvZ3Jlc3M=');

@$core.Deprecated('Use pingDescriptor instead')
const Ping$json = {
  '1': 'Ping',
  '2': [
    {'1': 'text', '3': 1, '4': 1, '5': 9, '10': 'text'},
  ],
};

/// Descriptor for `Ping`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pingDescriptor = $convert.base64Decode(
    'CgRQaW5nEhIKBHRleHQYASABKAlSBHRleHQ=');

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode(
    'CgVFbXB0eRIUCgV2YWx1ZRgBIAEoCVIFdmFsdWU=');

