import 'package:flutter/material.dart';
import '../widgets/bubble-menu.dart';

class MainScreenWrapper extends StatelessWidget {
  final Widget child;

  const MainScreenWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          child,

          const BubbleMenu(),
        ],
      ),
    );
  }
}
