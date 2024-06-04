import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String showText = "This is stack";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  'https://picsum.photos/250?image=3',
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 15,
                  right: 15,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text('\$1,450'),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 15,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(180),
                    ),
                    child: Text('Lorem Ipsum Dolor Sit Amet'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Text(showText),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    showText = "Hello World";
                  });
                },
                child: Text('Buy Now'))
          ],
        ),
      ),
    );
  }
}
