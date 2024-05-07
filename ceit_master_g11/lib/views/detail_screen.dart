import 'dart:convert';

import 'package:ceit_master_g11/views/third_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool? isFavorite;
  late http.Response data;
  String title = "Detail Screen";

  @override
  void initState() {
    isFavorite = true;
    getData();
    super.initState();
  }

  Future getData() async {
    // get data from REST api using http
    data = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts/2"));
    var decodedResponse = jsonDecode(data.body) as Map;
    var res = Uri.parse(decodedResponse['title'] as String);
    setState(() {
      title = res.toString();
    });
    return "Data";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ລາຍລະອຽດ"),
      ),
      body: Center(
          child: Column(
        children: [
          Text(title),
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                margin: const EdgeInsets.all(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images/testimg.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red.withAlpha(80),
                          borderRadius: BorderRadius.circular(18)),
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(10),
                      child: const Text("20,000 KIP",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)))),
              Positioned(
                  top: 20,
                  right: 20,
                  child: Container(
                      margin: EdgeInsets.all(20),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite!;
                          });
                        },
                        icon: Icon(Icons.favorite),
                        color: isFavorite! ? Colors.red : Colors.grey,
                      )))
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ThirdScreen()));
            },
            child: const Text("ໜ້າຖັດໄປ",
                style: TextStyle(fontFamily: 'phetsarath')),
          ),
        ],
      )),
    );
  }
}
