import 'package:flutter/material.dart';
import 'package:student_lite/widgets/AppBar.dart';
import 'package:student_lite/widgets/Search.dart';
import 'package:student_lite/Home/Tab_Home.dart';
import 'package:student_lite/widgets/AnimatedBottomNavigationBar.dart';
import 'package:student_lite/widgets/fab.dart';

class Home extends StatefulWidget {
  final String searchQuery;

  const Home({Key? key, required this.searchQuery}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onSearchSubmitted:(String query) {},),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Search(),
            Expanded(
              child: TabHome(searchQuery: widget.searchQuery),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0,0,155,0),
        child:
          fab(),
      ),
      bottomSheet: Stack(
        children: [
          MyHomePage(searchQuery: 'widget.searchQuery',),
        ],
      ),
    );
  }
}
