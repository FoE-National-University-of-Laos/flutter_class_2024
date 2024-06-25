import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String showText = "This is stack";
  bool isTurnon = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
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
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter a full name',
                      labelText: 'Full Name',
                      border: OutlineInputBorder()),
                ),
                SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    } else if (value.length > 10 || value.length < 9) {
                      return 'ກະລຸນາຕື່ມເບີໂທໃຫ້ຢູ່ລະຫວ່າງ 9-10 ໂຕເລກ';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'ex. 0205678910',
                      labelText: 'Phone (ex. 0205678910)',
                      border: OutlineInputBorder()),
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    } else if (!value.contains("@")) {
                      return "this form is not email";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                      border: OutlineInputBorder()),
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      border: OutlineInputBorder()),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Turn on the light"),
                    Switch(
                      value: isTurnon,
                      activeColor: Colors.red,
                      onChanged: (bool value) {
                        setState(() {
                          isTurnon = value;
                        });
                      },
                    )
                  ],
                ),
                Text(showText),
                ElevatedButton(
                    onPressed: () {
                      // setState(() {
                      //   showText = "Hello World";
                      // });
                      if (_formKey.currentState!.validate()) {
                        print("Processing data....");
                      }
                    },
                    child: Text('Buy Now'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
