import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("4COM3"),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24)),
                    color: Colors.green,
                  ),
                  child: Center(
                      child: Animate(effects: [
                    SlideEffect(duration: Duration(seconds: 2))
                  ], child: Text("CEIT"))),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 200,
                  height: 100,
                  color: Colors.yellow,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ));
  }
}
