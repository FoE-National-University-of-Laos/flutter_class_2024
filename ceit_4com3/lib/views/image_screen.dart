import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image Screen")),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 90,
            height: 100,
            child: Image.asset(
              "assets/images/img1.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 90,
            height: 100,
            child: Image.asset(
              "assets/images/img2.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 90,
            height: 100,
            child: Image.asset(
              "assets/images/img3.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 90,
            height: 100,
            child: Image.asset(
              "assets/images/img4.png",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
