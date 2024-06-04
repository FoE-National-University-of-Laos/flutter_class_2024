import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String showText = "State Example";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CEIT")),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  "https://picsum.photos/350?image=12",
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: Text("\$1,000")),
                ),
                Positioned(
                  bottom: 30,
                  left: 30,
                  child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white.withAlpha(150),
                          borderRadius: BorderRadius.circular(16)),
                      child: Text("Lorem Ipsum Dolor Sit Amet")),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              showText,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    showText = "State Changed";
                  });
                },
                child: Text("Buy Now"))
          ],
        ),
      ),
    );
  }
}
