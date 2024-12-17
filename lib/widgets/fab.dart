import "package:flutter/material.dart";
import "package:student_lite/Home/post-new-room-88.dart";
import "package:student_lite/Home/post.dart";

class fab extends StatelessWidget {
  const fab({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Positioned(
      child: Container(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => post(),
              ),
            );
          },
          backgroundColor: Color(0xFFCBC9C9),
          child: Icon(
            Icons.post_add,
            size: 40,
            color: Colors.white,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
        ),
      ),
    );
  }
}