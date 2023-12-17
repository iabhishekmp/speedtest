import 'dart:io';

import 'package:protos/protos.dart';

import 'speedtest_service.dart';

Future<void> main(List<String> arguments) async {
  final server = Server.create(
    services: [
      SpeedTestService(),
    ],
    errorHandler: (e, st) {
      print(e);
      print(st);
    },
  );

  await server.serve(
    port: int.parse(Platform.environment['port'] ?? '4001'),
  );
  print('Server started on ${server.port}');
}
