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

  late final TextEditingController _totalSizeController;
  late final TextEditingController _chunkSizeController;

  final stopwatch = Stopwatch();
  @override
  void initState() {
    super.initState();
    _totalSizeController = TextEditingController(text: '100');
    _chunkSizeController = TextEditingController(text: '1');

    _channel = ClientChannel(
      '141.148.203.16',
      port: int.parse(Platform.environment['port'] ?? '4001'),
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );

    _stub = SpeedTestClient(_channel);
  }

  void startSpeedTest() async {
    final yo = await _stub.ping(Ping(text: "Pinging"));
    log(yo.value);
    stopwatch.reset();
    stopwatch.start();
    // 1,000,000 = 1 MB
    stream = _stub.downloadFile(
      DownloadRequest(
        totalSize: int.parse(_totalSizeController.text),
        chunkSize: int.parse(_chunkSizeController.text),
      ),
    );
    setState(() {});
  }

  @override
  void dispose() {
    _totalSizeController.dispose();
    _chunkSizeController.dispose();
    _channel.shutdown();
    super.dispose();
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _chunkSizeController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          label: Text('ChunkSize'),
                        ),
                      ),
                      TextFormField(
                        controller: _totalSizeController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          label: Text('TotalSize'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              stream == null
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
                        final progress = snapshot.data?.progress;
                        if (snapshot.connectionState.name == "done") {
                          stopwatch.stop();
                        }
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                'Connection State: ${snapshot.connectionState}'),
                            Text('Progress: $progress'),
                            if (progress != null)
                              LinearProgressIndicator(
                                value: progress / 100,
                              ),
                            const SizedBox(height: 20),
                            Text(
                                'Time taken: ${stopwatch.elapsed.inMilliseconds / 1000} sec')
                          ],
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
