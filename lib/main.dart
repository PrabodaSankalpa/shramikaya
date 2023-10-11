import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shramikaya/screens/home_page.dart';
import 'package:shramikaya/utils/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Shramikaya",
      theme: ThemeData(
        scaffoldBackgroundColor: silverColor,
      ),
      home: HomePage(),
    );
  }
}
