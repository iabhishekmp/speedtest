//
//  Generated code. Do not modify.
//  source: speedtest.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'speedtest.pb.dart' as $0;

export 'speedtest.pb.dart';

@$pb.GrpcServiceName('SpeedTest')
class SpeedTestClient extends $grpc.Client {
  static final _$ping = $grpc.ClientMethod<$0.Ping, $0.Empty>(
      '/SpeedTest/ping',
      ($0.Ping value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$downloadFile = $grpc.ClientMethod<$0.DownloadRequest, $0.DownloadData>(
      '/SpeedTest/DownloadFile',
      ($0.DownloadRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DownloadData.fromBuffer(value));

  SpeedTestClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.Empty> ping($0.Ping request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$ping, request, options: options);
  }

  $grpc.ResponseStream<$0.DownloadData> downloadFile($0.DownloadRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$downloadFile, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('SpeedTest')
abstract class SpeedTestServiceBase extends $grpc.Service {
  $core.String get $name => 'SpeedTest';

  SpeedTestServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Ping, $0.Empty>(
        'ping',
        ping_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Ping.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DownloadRequest, $0.DownloadData>(
        'DownloadFile',
        downloadFile_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.DownloadRequest.fromBuffer(value),
        ($0.DownloadData value) => value.writeToBuffer()));
  }

  $async.Future<$0.Empty> ping_Pre($grpc.ServiceCall call, $async.Future<$0.Ping> request) async {
    return ping(call, await request);
  }

  $async.Stream<$0.DownloadData> downloadFile_Pre($grpc.ServiceCall call, $async.Future<$0.DownloadRequest> request) async* {
    yield* downloadFile(call, await request);
  }

  $async.Future<$0.Empty> ping($grpc.ServiceCall call, $0.Ping request);
  $async.Stream<$0.DownloadData> downloadFile($grpc.ServiceCall call, $0.DownloadRequest request);
}
