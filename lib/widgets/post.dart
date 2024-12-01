import 'package:flutter/material.dart';
import 'package:student_lite/utils/config-color.dart';
import 'package:student_lite/utils/config-text.dart';

class Post extends StatelessWidget {
  final String name;
  final String timeAgo;
  final String content;
  final String imageUrl;
  final List<Widget> comments;
  Post({required this.name, required this.timeAgo, required this.content, this.comments = const[], required this.imageUrl});

  @override
  Widget build(BuildContext context){
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: StyleConfigText.bodyTextSemiBold1,),
                    Text(timeAgo, style: StyleConfigText.bodyTextBlack3,),
                  ],
                ),
                Spacer(),
                Icon(Icons.more_horiz),
              ],
            ),
            SizedBox(height: 10,),
            Text(content),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(imageUrl),
                Image.asset(imageUrl),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Icon(Icons.favorite_border),
                SizedBox(width: 10),
                Icon(Icons.comment),
                SizedBox(width: 10),
                Icon(Icons.share),
              ],
            ),
            if (comments.isNotEmpty) ...[
              Divider(),
              ...comments,
              TextButton(onPressed: () {}, child: Text("Xem bình luận")),
            ]
          ],
        )
      ),
    );
  }
}