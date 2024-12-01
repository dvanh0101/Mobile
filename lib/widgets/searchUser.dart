import 'package:flutter/material.dart';
import 'package:student_lite/utils/config-text.dart';

class SearchUser extends StatelessWidget {
const SearchUser({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        Image.asset("assets/images/avatar.png"),
        Column(
          children: [
            Text(
              "Biệt danh",
              style: StyleConfigText.bodyTextSemiBold1,
            )
          ],
        ),
        TextButton(
          // style: ButtonStyle(
          //   backgroundColor: ,
          // ),
          onPressed: () {}, 
          child: Text('Theo dõi'),
        ),
      ],
    );
  }
}