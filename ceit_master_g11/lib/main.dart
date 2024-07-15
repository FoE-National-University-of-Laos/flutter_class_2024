import 'package:ceit_master_g11/auth_screen.dart';
import 'package:ceit_master_g11/firebase_options.dart';
import 'package:ceit_master_g11/home_screen.dart';
import 'package:ceit_master_g11/providers/count_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:provider/provider.dart';

import 'providers/animal_provider.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'notosan'),
      home: MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => AnimalProvider()),
        ChangeNotifierProvider(create: (_) => CountProvider(counter: 0)),
      ], child: AuthScreen()),
    );
  }
}
