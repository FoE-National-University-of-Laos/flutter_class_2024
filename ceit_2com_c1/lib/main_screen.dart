import 'package:flutter/material.dart';

import 'views/detail_screen.dart';

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
        title: Icon(Icons.headphones),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                )
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
                        topLeft: Radius.circular(38),
                        bottomRight: Radius.circular(38)),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.black,
                ),
              ],
            ),
            Container(
              height: 100,
              width: 500,
              margin: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(38),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 25,
                    spreadRadius: 5,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: const Center(
                child: Text(
                  'Hello World',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Icon(
              Icons.airplane_ticket,
              size: 100,
              color: Colors.teal,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(onPressed: () {}, child: Text("Cancel")),
                ElevatedButton(onPressed: () {}, child: Text("Accept")),
                OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(),
                        ),
                      );
                    },
                    child: Text("Outlined")),
                IconButton(onPressed: () {}, icon: Icon(Icons.add))
              ],
            ),
            Image.network("https://picsum.photos/250?image=9"),
          ],
        ),
      ),
    );
  }
}
