import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Images"),
      ),
      body: Column(
        children: [
          Row(
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
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
              "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
              "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
              "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
              "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
        ],
      ),
    );
  }
}
