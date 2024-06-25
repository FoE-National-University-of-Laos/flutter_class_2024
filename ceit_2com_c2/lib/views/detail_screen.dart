import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String showText = "State Example";
  bool securePassword = true;
  bool onoff = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CEIT")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
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
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "ກະລຸນາຕື່ມຂໍ້ມູນໃຫ້ຄົບຖ້ວນ";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Name"),
                      hintText: "Enter your name"),
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "ກະລຸນາຕື່ມຂໍ້ມູນໃຫ້ຄົບຖ້ວນ";
                    } else if (!value.contains('@')) {
                      return "ກະລຸນາປ້ອນຮູບແບບທີ່ເປັນອີເມວ";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Email"),
                      hintText: "Enter your Email"),
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "ກະລຸນາຕື່ມຂໍ້ມູນໃຫ້ຄົບຖ້ວນ";
                    } else if (value.length < 9 || value.length > 11) {
                      return "ກະລຸນາປ້ອນເບີໂທໃຫ້ຄົບ 9-11 ໂຕເລກ";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Tel (ex. 02056789101)"),
                      hintText: "Enter your Phone number"),
                ),
                SizedBox(height: 16),
                TextFormField(
                  obscureText: securePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "ກະລຸນາຕື່ມຂໍ້ມູນໃຫ້ຄົບຖ້ວນ";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(),
                    // Here is key idea
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        securePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          securePassword = !securePassword;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Turn the light on/off"),
                    Switch(
                      value: onoff,
                      activeColor: Colors.red,
                      onChanged: (bool value) {
                        setState(() {
                          onoff = value;
                        });
                      },
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      // setState(() {
                      //   showText = "State Changed";
                      // });
                      if (_formKey.currentState!.validate()) {
                        print("Processing data....");
                      }
                    },
                    child: Text("Buy Now"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
