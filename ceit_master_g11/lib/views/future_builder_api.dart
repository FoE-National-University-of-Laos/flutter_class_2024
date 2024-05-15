import 'package:ceit_master_g11/models/cat_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FutureBuilderForAPIScreen extends StatefulWidget {
  const FutureBuilderForAPIScreen({super.key});

  @override
  State<FutureBuilderForAPIScreen> createState() =>
      _FutureBuilderForAPIScreenState();
}

class _FutureBuilderForAPIScreenState extends State<FutureBuilderForAPIScreen> {
  Future<List<CatModel>> getData() async {
    Dio dio = Dio();
    dio.options.headers = {
      'X-Api-Key': 'SHHS0gHM0ux/+YDrN8trrA==GtSD1IOIyWI6EK6i',
    };
    Response response =
        await dio.get('https://api.api-ninjas.com/v1/cats?name=a');
    List<dynamic> catList = response.data;
    List<CatModel> cats =
        catList.map((json) => CatModel.fromJson(json)).toList();
    return cats;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Future Builder Screen"),
      ),
      body: Center(
        child: FutureBuilder<List<CatModel>>(
            future: getData(),
            builder: (context, AsyncSnapshot snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        CatModel cat = snapshot.data[index];
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
                              Text(
                                  "Weight - Min:${cat.minWeight} - Max:${cat.maxWeight}"),
                            ],
                          ),
                        );
                      },
                    )
                  : LottieBuilder.asset(
                      "assets/loadingindicator.json",
                      width: 358,
                    );
              // if (snapshot.hasData) {
              //   return Text("Data from function is: ${snapshot.data}");
              // } else if (snapshot.hasError) {
              //   return Text("${snapshot.error}");
              // } else {
              //   return const CircularProgressIndicator();
              // }
            }),
      ),
    );
  }
}
