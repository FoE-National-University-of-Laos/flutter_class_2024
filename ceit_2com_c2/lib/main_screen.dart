import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CEIT")),
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
                color: Colors.blue,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.yellow,
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32))),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.black,
              ),
            ],
          ),
          Container(
            width: 500,
            height: 150,
            margin: const EdgeInsets.all(32),
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(32),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(4, 4),
                      blurRadius: 10,
                      spreadRadius: 3)
                ]),
            child: const Center(
                child: Text(
              "Hello world",
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: () {}, child: Text("Cancel")),
              ElevatedButton(onPressed: () {}, child: Text("OK")),
              OutlinedButton(onPressed: () {}, child: Text("Submit")),
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            ],
          ),
          Image.network("https://picsum.photos/250?image=10"),
          const Icon(Icons.build_circle, size: 50, color: Colors.teal),
        ],
      ),
    );
  }
}
