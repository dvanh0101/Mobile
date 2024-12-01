import "package:flutter/material.dart";
import "package:student_lite/utils/config-color.dart";

class NavbarFooter extends StatelessWidget {
const NavbarFooter({ Key? key }) : super(key: key);

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
            icon: Image.asset('assets/images/home.png')
          ),
          IconButton(
            onPressed: () {}, 
            icon: Image.asset('assets/images/chart.png')
          ),
          SizedBox(width: 40), // Khoảng trống cho FAB
          IconButton(
            icon: Image.asset('assets/images/bell.png'),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset('assets/images/user.png'),
            onPressed: () {},
          ),
        ],
      )
    );
  }
}