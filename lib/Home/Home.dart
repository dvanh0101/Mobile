import 'package:flutter/material.dart';
import 'package:student_lite/Home/Search.dart';
import 'package:student_lite/Home/Tab_Home.dart';

class Home extends StatelessWidget {
  final String searchQuery;

  const Home({Key? key, required this.searchQuery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Lite'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Search(),
            Expanded(
              child: TabHome(searchQuery: searchQuery),
            ),
          ],
        ),
      ),
    );
  }
}
