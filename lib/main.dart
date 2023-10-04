import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shramikaya/screens/authentication/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Shramikaya",
      home: LoginScreen(),
    );
  }
}
