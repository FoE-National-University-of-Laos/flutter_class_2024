import 'dart:convert';

import 'package:ceit_master_g11/views/third_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    getDatafromLocal();
    super.initState();
  }

  Future getDatafromLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? favorite = prefs.getBool("isFavorite");
    if (favorite != null) {
      setState(() {
        isFavorite = favorite;
      });
    } else {
      isFavorite = false;
    }
  }

  // save data to local storage (shared preference)
  void saveData(bool favorite) async {
    // save data to local storage
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isFavorite", favorite);
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
      body: SingleChildScrollView(
        child: Center(
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
                              saveData(isFavorite!);
                            });
                          },
                          icon: Icon(Icons.favorite),
                          color: isFavorite != null && isFavorite!
                              ? Colors.red
                              : Colors.grey,
                        )))
              ],
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
                "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
                "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
                "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 300,
              child: PrettyQrView.data(
                data: 'Savath Saypadith',
                decoration: const PrettyQrDecoration(
                  image: PrettyQrDecorationImage(
                    image: AssetImage('assets/images/testimg.jpeg'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
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
      ),
    );
  }
}
