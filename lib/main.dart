import 'package:flutter/material.dart';
import 'package:student_lite/Home/AnimatedBottomNavigationBar.dart';
import 'package:student_lite/Home/Home.dart';
import 'package:student_lite/Home/Tab_Home.dart';
import 'package:student_lite/screens/44_31.dart';
import 'package:student_lite/screens/welcome-app.dart';
import 'package:student_lite/screens/reset_password.dart';
import 'package:student_lite/User/Account_Setting.dart';
import 'package:student_lite/User/Save_Post.dart';
import 'package:student_lite/User/Discount.dart';
import 'package:student_lite/screens/login-page.dart';
import 'package:student_lite/screens/signin_page.dart';
import 'package:student_lite/Home/SP_67.dart';
import 'package:student_lite/screens/test.dart';
import 'package:student_lite/screens/request-reservation-dialog-52.dart';
import 'package:student_lite/screens/SP_xemphong.dart';
import 'package:student_lite/Home/Tab_Home.dart';


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
      home:  MyHomePage(title: 'title'),
    );
  }
}

