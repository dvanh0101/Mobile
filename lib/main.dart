import 'package:flutter/material.dart';
import 'package:student_lite/Login/welcome-app.dart';
import 'package:student_lite/widgets/fab.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      home:  welcomeApp(),
    );
  }
}

