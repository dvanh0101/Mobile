import 'package:flutter/material.dart';
import 'package:student_lite/Home/AnimatedBottomNavigationBar.dart';
import 'package:student_lite/Home/Tab_Home.dart';
import 'package:student_lite/screens/44_31.dart';
import 'package:student_lite/screens/welcome-app.dart';
import 'package:student_lite/screens/reset_password.dart';
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
      home:  MyHomePage(title: '',),
    );
  }
}

