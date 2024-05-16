import 'dart:async';

import 'package:flutter/material.dart';

class StreamBuilderScreen extends StatefulWidget {
  const StreamBuilderScreen({super.key});

  @override
  State<StreamBuilderScreen> createState() => _StreamBuilderScreenState();
}

class _StreamBuilderScreenState extends State<StreamBuilderScreen> {
  StreamController _streamController = StreamController();

  void getCounter() async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      _streamController.sink.add(i);
    }
  }

  @override
  void initState() {
    getCounter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream Builder"),
      ),
      body: Center(
        child: StreamBuilder(
            stream: _streamController.stream,
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? Text(
                      "Counting: ${snapshot.data}",
                      style: TextStyle(fontSize: 24),
                    )
                  : const CircularProgressIndicator();
            }),
      ),
    );
  }
}
