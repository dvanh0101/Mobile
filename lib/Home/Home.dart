import 'package:flutter/material.dart';
import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:student_lite/Home/Profile.dart';
import 'package:student_lite/Home/Search.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:searchfield/searchfield.dart';
import 'package:student_lite/Home/Tab_Home.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Lite'),
      ),
      body: Padding(
            padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Search(),
              TabHome(),
            ],
          ),
      ),
    );
  }
}
