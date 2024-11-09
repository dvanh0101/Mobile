import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:student_lite/Home/Notifications.dart';
import 'package:student_lite/Home/Profile.dart';
import 'package:student_lite/Home/Web_Stories.dart';
import 'package:student_lite/Home/Home.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _bottomNavIndex = 0; // Default index of the first screen

  final iconList = <IconData>[
    Icons.home,
    Icons.web_stories,
    Icons.notifications,
    Icons.person,
  ];
  final autoSizeGroup = AutoSizeGroup();
  final List<Widget> _screens = [
    Home(),
    web_stories(),
    notifications(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _screens[_bottomNavIndex],
      floatingActionButton: Container(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          backgroundColor: Colors.black26,
          onPressed: () {},
          child: Icon(
            Icons.post_add,
            size: 50,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Colors.blue : Colors.white;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                size: 50,
                color: color,
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
              )
            ],
          );
        },
        activeIndex: _bottomNavIndex,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.center,
        backgroundColor: Colors.black26,
        height: 70,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }
}