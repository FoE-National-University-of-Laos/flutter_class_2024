import 'package:flutter/material.dart';

class FutureBuilderScreen extends StatefulWidget {
  const FutureBuilderScreen({super.key});

  @override
  State<FutureBuilderScreen> createState() => _FutureBuilderScreenState();
}

class _FutureBuilderScreenState extends State<FutureBuilderScreen> {
  Future<int> getData() async {
    await Future.delayed(const Duration(seconds: 5));
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Future Builder Screen"),
      ),
      body: Center(
        child: FutureBuilder<int>(
            future: getData(),
            builder: (context, AsyncSnapshot snapshot) {
              return snapshot.hasData
                  ? Text("Data from function is: ${snapshot.data}")
                  : const CircularProgressIndicator();
              // if (snapshot.hasData) {
              //   return Text("Data from function is: ${snapshot.data}");
              // } else {
              //   return const CircularProgressIndicator();
              // }
            }),
      ),
    );
  }
}
