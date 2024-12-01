import 'package:flutter/material.dart';
import 'package:student_lite/widgets/appbar_social.dart';
import 'package:student_lite/widgets/comment.dart';
import 'package:student_lite/widgets/post.dart';
import 'package:student_lite/widgets/bottomBar_social.dart';
import "package:student_lite/widgets/navbar_footer.dart";

class UiHomeSocial extends StatefulWidget {
  const UiHomeSocial({Key? key}) : super(key: key);

  @override
  _UiHomeSocialState createState() => _UiHomeSocialState();
}

class _UiHomeSocialState extends State<UiHomeSocial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSocial(),
      body: SafeArea(
        child: (
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Post(
                  name: "Name",
                  timeAgo: "12 hour",
                  content: "Tìm trọ giá rẻ dành cho sinh viên",
                  imageUrl: "assets/images/message_gif.png",
                  comments: [Comment(author: "Name", text: "CMT VÀO ĐÂY")],
                ),
                Post(
                  name: "Name",
                  timeAgo: "12 hour",
                  content: "Tìm trọ giá rẻ dành cho sinh viên",
                  imageUrl: "assets/images/message_gif.png",
                )
              ],
            ),
          )
        ),
      ),
      bottomNavigationBar: BottomBarSocial(),
      
      // ListView(
      //   children: [
      //     Post(
      //       name: "Name",
      //       timeAgo: "12 hour",
      //       content: "Tìm trọ giá rẻ dành cho sinh viên",
      //       imageUrl: "assets/images/message.png",
      //       comments: [Comment(author: "Name", text: "CMT VÀO ĐÂY")],
      //     ),
      //     Post(
      //       name: "Name",
      //       timeAgo: "12 hour",
      //       content: "Tìm trọ giá rẻ dành cho sinh viên",
      //       imageUrl: "assets/images/message.png",
      //     )
      //   ],
      // ),
    );
  }
}
