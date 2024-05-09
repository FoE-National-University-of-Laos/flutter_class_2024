import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:ceit_master_g11/models/cat_model.dart';

class CatListScreen extends StatefulWidget {
  const CatListScreen({super.key});

  @override
  _CatListScreenState createState() => _CatListScreenState();
}

class _CatListScreenState extends State<CatListScreen> {
  List<CatModel> cats = [];

  @override
  void initState() {
    super.initState();
    fetchCats();
  }

  Future<void> fetchCats() async {
    try {
      Dio dio = Dio();
      dio.options.headers = {
        'X-Api-Key': 'SHHS0gHM0ux/+YDrN8trrA==GtSD1IOIyWI6EK6i',
      };
      Response response =
          await dio.get('https://api.api-ninjas.com/v1/cats?name=a');
      List<dynamic> catData = response.data;
      setState(() {
        cats = catData.map((json) => CatModel.fromJson(json)).toList();
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat List'),
      ),
      body: ListView.builder(
        itemCount: cats.length,
        itemBuilder: (context, index) {
          CatModel cat = cats[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(cat.imageLink),
              radius: 25,
            ),
            title: Text(cat.name),
            subtitle: Text(cat.origin),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "Life Exp - Min:${cat.minLifeExpectancy} - Max:${cat.maxLifeExpectancy} "),
                SizedBox(height: 4),
                Text("Weight - Min:${cat.minWeight} - Max:${cat.maxWeight}"),
              ],
            ),
          );
        },
      ),
    );
  }
}
