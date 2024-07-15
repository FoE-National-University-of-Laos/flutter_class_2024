import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String showText = "Simple Text";
  bool light = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.all(24),
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.network("https://picsum.photos/400/200"),
                    Positioned(
                      left: 24,
                      bottom: 24,
                      child: Container(
                          padding: EdgeInsets.all(4),
                          color: Colors.white.withAlpha(200),
                          child: Text("2024 - Vientiane, Laos")),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(showText),
                const SizedBox(height: 24),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Name"),
                    hintText: "Please enter your name",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "ກະລຸນາຕື່ມຂໍ້ມູນໃຫ້ຖືກຕ້ອງ";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    label: Text("Email"),
                    border: OutlineInputBorder(),
                    hintText: "Please enter your email address",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "ກະລຸນາຕື່ມຂໍ້ມູນໃຫ້ຖືກຕ້ອງ";
                    } else if (!value.contains("@")) {
                      return "ກະລຸນາໃສ່ອີເມວໃຫ້ຖືກຕ້ອງ";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    label: Text("Tel"),
                    border: OutlineInputBorder(),
                    hintText: "Please enter your phone number",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "ກະລຸນາຕື່ມຂໍ້ມູນໃຫ້ຖືກຕ້ອງ";
                    } else if (value.length < 9 || value.length > 11) {
                      return "ກະລຸນາໃສ່ເບີໂທ 9-11 ໂຕເລກ";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    label: Text("Password"),
                    border: OutlineInputBorder(),
                    hintText: "Enter your password",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "ກະລຸນາຕື່ມຂໍ້ມູນໃຫ້ຖືກຕ້ອງ";
                    } else if (value.length < 8) {
                      return "ກະລຸນາໃສ່ລະຫັດຜ່ານຂັ້ນຕ່ຳ 8 ໂຕ";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Turn on/off the light"),
                    Switch(
                      // This bool value toggles the switch.
                      value: light,
                      activeColor: Colors.red,
                      onChanged: (bool value) {
                        // This is called when the user toggles the switch.
                        setState(() {
                          light = value;
                        });
                      },
                    )
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("Processing data");
                    }
                    // setState(() {
                    //   showText = "State changed!";
                    // });
                  },
                  child: Text("Submit"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
