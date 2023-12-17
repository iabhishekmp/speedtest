import 'dart:math';
import 'dart:typed_data';

import 'package:protos/protos.dart';

class SpeedTestService extends SpeedTestServiceBase {
  @override
  Stream<DownloadData> downloadFile(
    ServiceCall call,
    DownloadRequest request,
  ) async* {
    //? request parameters
    final chunkSize = request.chunkSize;
    final totalBytes = request.totalSize;

    //? calculation variables
    int sentBytes = 0;

    //? generating random bytes
    final bytes = Uint8List.fromList(
      List.generate(
        totalBytes,
        (_) => Random().nextInt(256),
      ),
    ).toList();

    //? sending
    while (bytes.isNotEmpty) {
      final data = bytes.take(chunkSize);
      if (chunkSize == data.length) {
        bytes.removeRange(0, chunkSize);
      } else {
        bytes.removeRange(0, data.length);
      }
      sentBytes += data.length;
      yield DownloadData(
        data: data.toList(),
        progress: ((sentBytes / totalBytes) * 100).roundToDouble(),
      );
    }
  }

  @override
  Future<Empty> ping(ServiceCall call, Ping request) async {
    print('hehe: $request');
    return Empty(value: 'Received: ${request.text}');
  }
}
