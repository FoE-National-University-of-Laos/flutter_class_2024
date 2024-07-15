import 'dart:io';

import 'package:ceit_master_g11/providers/count_provider.dart';
import 'package:ceit_master_g11/services/auth_service.dart';
import 'package:ceit_master_g11/views/cat_list_screen.dart';
import 'package:ceit_master_g11/views/detail_screen.dart';
import 'package:ceit_master_g11/views/form_examples.dart';
import 'package:ceit_master_g11/views/provider_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/future_builder_api.dart';
import 'views/future_builder_screen.dart';
import 'views/stream_builder_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.auth});
  final AuthService auth;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Home Screen"),
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(24),
                  padding: const EdgeInsets.only(
                      top: 20, left: 10, right: 10, bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                    color: Colors.grey.shade300,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.qr_code,
                              size: 38,
                            ),
                            Text("QR Code"),
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_alert,
                              size: 38,
                            ),
                            Text("Notification"),
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.comment,
                              size: 38,
                            ),
                            Text("Feedback"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Text(
                        widget.auth.currecUser != null
                            ? "Hello ${widget.auth.currecUser!.displayName}"
                            : "Hello!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      const Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac nisl Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac nisl Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac nisl Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac nisl Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac nisl"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DetailScreen(),
                                ),
                              );
                            },
                            child: const Text("Read more"),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CatListScreen()));
                              },
                              child: const Text("Cat List"))
                        ],
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const FutureBuilderScreen(),
                                ),
                              );
                            },
                            child: const Text("FutureBuilder"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const FutureBuilderForAPIScreen(),
                                ),
                              );
                            },
                            child: const Text("FutureBuilder API"),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const StreamBuilderScreen(),
                                ),
                              );
                            },
                            child: const Text("StreamBuilder"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const FormExampleScreen(
                                      name: "Master G11"),
                                ),
                              );
                              // Get.to(FormExampleScreen());
                            },
                            child: const Text("Form Example"),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProviderScreen(),
                            ),
                          );
                          // Get.to(FormExampleScreen());
                        },
                        child: const Text("Provider Example"),
                      ),
                      Consumer<CountProvider>(
                        builder: (context, data, child) => Text(
                          'Count: ${data.counter}',
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              context.read<CountProvider>().decrement();
                            },
                            child: Text("-"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context.read<CountProvider>().increment();
                            },
                            child: Text("+"),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
