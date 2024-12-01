import 'package:flutter/material.dart';
import 'package:student_lite/utils/config-text.dart';

class AppbarSp extends StatelessWidget implements PreferredSizeWidget {
@override
  final Size preferredSize;

  AppbarSp({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context){
    return AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Student Life',
              style: StyleConfigText.title1,
            ),
          ],
        ),
        leading: IconButton(
          icon: Image.asset('assets/images/arrow_left-circle.png'),
          onPressed: () {
            //Xu ly quay lai trang truoc
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                //Xu ly thanh menu
              },
              icon: Image.asset('assets/images/menu_icon.png'),
            )
        ],
      );
  }
}