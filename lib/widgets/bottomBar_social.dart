import 'package:flutter/material.dart';
import "package:student_lite/utils/config-color.dart";

class BottomBarSocial extends StatelessWidget {
const BottomBarSocial({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return BottomAppBar(
      color: StyleConfigColor.text2Dark2,
      shape: CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.home)
          ),
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.search)
          ),
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.add_circle_outline)
          ),
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.favorite_border)
          ),
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.person_outline)
          ),
        ],
      )
    );
  }
}