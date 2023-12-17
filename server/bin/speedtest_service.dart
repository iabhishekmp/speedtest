import 'dart:io';

import 'package:async/async.dart';
import 'package:protos/protos.dart';

class SpeedTestService extends SpeedTestServiceBase {
  @override
  Stream<DownloadData> downloadFile(
    ServiceCall call,
    DownloadRequest request,
  ) async* {
    final file = switch (request.fileSize) {
      FileSize.MB1 => File('bin/fake1.txt'),
      FileSize.MB25 => File('bin/fake.txt'),
      _ => File('bin/fake1.txt'),
    };
    final r = ChunkedStreamReader(file.openRead());
    final totalSize = await file.length();
    int sentBytes = 0;
    try {
      while (sentBytes != totalSize) {
        final data = await r.readChunk(request.chunkSize);
        sentBytes += data.length;
        yield DownloadData(
          data: data,
          progress: ((sentBytes / totalSize) * 100).roundToDouble(),
        );
      }
    } catch (e, st) {
      print("Error in downloadFile, $e, $st");
    } finally {
      r.cancel();
    }
  }

  @override
  Future<Empty> ping(ServiceCall call, Ping request) async {
    print('hehe: $request');
    return Empty(value: 'Received: ${request.text}');
  }
}
