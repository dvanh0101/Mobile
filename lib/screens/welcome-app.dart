import 'package:flutter/material.dart';
import 'package:student_lite/screens/test.dart';
import 'package:student_lite/utils/config-color.dart';
import 'package:student_lite/widgets/input_box.dart';

class welcomeApp extends StatefulWidget {
  const welcomeApp({super.key});

  @override
  State<welcomeApp> createState() => _welcomeAppState();
}

class _welcomeAppState extends State<welcomeApp> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black87,
          scrolledUnderElevation: 7,
          elevation: 7,
          title: const Text('Benefits',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              )),
          bottom: TabBar(
            indicatorColor: const Color.fromRGBO(25, 110, 130, 1),
            indicatorWeight: 3,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color.fromRGBO(25, 110, 130, 1),
                  width: 5,
                ),
              ),
            ),
            labelPadding: const EdgeInsets.all(0),
            labelColor: Colors.black,
            labelStyle: StyleConfig.textTitle,
            unselectedLabelStyle: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 13,
            ),
            tabs: const [
              Tab(
                text: 'Login',
              ),
              Tab(
                text: 'Sign up',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            avs(),
            avs(),
          ],
        ),
      ),
    );
  }
}
