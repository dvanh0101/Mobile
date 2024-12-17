import 'package:flutter/material.dart';
import 'package:student_lite/Home/SP_67.dart';
import 'package:student_lite/Notifications/63-64.dart';
import 'package:student_lite/Web_Stories/ui_user_62.dart';
import 'package:student_lite/User/48.dart';

class MyHomePage extends StatefulWidget {
  final String searchQuery;

  const MyHomePage({Key? key, required this.searchQuery}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  void _changeTextColor(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xFFCBC9C9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              _changeTextColor(0);
              setState(() {
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => sp_67(),
                ),
              );
            },
            icon: Icon(
              Icons.home,
              size: 50,
              color: _selectedIndex == 0 ? Colors.blue : Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _changeTextColor(1);
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UiUser62(),
                ),
              );
            },
            icon: Icon(
              Icons.web_stories,
              size: 50,
              color: _selectedIndex == 1 ? Colors.blue : Colors.white,
            ),
          ),
          SizedBox(width: 40),
          IconButton(
            onPressed: () {
              setState(() {
                _changeTextColor(2);
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ActivitiesAndNews(),
                ),
              );
            },
            icon: Icon(
              Icons.notifications,
              size: 50,
              color: _selectedIndex == 2 ? Colors.blue : Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _changeTextColor(3);
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Screen_48(favoriteList: [],),
                ),
              );
            },
            icon: Icon(
              Icons.person,
              size: 50,
              color: _selectedIndex == 3 ? Colors.blue : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
