import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:protos/protos.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final ClientChannel _channel;
  late final SpeedTestClient _stub;
  ResponseStream<DownloadData>? stream;
  @override
  void initState() {
    super.initState();
    _channel = ClientChannel(
      '192.168.72.14',
      port: int.parse(Platform.environment['port'] ?? '8080'),
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );

    _stub = SpeedTestClient(_channel);
  }

  void startSpeedTest() async {
    final yo = await _stub.ping(Ping(text: "Pinging"));
    log(yo.value);
    setState(() {
      stream = null;
    });
    // 1,000,000 = 1 MB
    stream = _stub.downloadFile(
      DownloadRequest(
        totalSize: 50000000,
        chunkSize: 1000000,
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          label: const Text('Start'),
          onPressed: startSpeedTest,
        ),
        body: Center(
          child: stream == null
              ? const Text('Please start')
              : StreamBuilder<DownloadData>(
                  stream: stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      log(
                        "Error in stream",
                        error: snapshot.error,
                        stackTrace: snapshot.stackTrace,
                      );
                      return Text(snapshot.error.toString());
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Connection State: ${snapshot.connectionState}'),
                        Text('Progress: ${snapshot.data?.progress}'),
                        if (snapshot.data != null)
                          LinearProgressIndicator(
                            value: (snapshot.data!.progress) / 100,
                          )
                      ],
                    );
                  },
                ),
        ),
      ),
    );
  }
}
