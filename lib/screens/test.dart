import 'package:flutter/material.dart';
import 'package:student_lite/widgets/input_box.dart';
import 'package:student_lite/widgets/button_login_with.dart';

class avs extends StatefulWidget {
  const avs({super.key});

  @override
  State<avs> createState() => _avsState();
}

class _avsState extends State<avs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Column(
        children: [
          InputBox.inputDecoration(
              '', TextEditingController(), const Icon(Icons.person)),
        ],
      ),
    ));
  }
}
