import 'package:flutter/material.dart';
import 'package:student_lite/widgets/AppBar.dart';
import 'package:student_lite/widgets/AnimatedBottomNavigationBar.dart';
import 'package:student_lite/User/Save_Post.dart';
import 'package:student_lite/User/Discount.dart';
import 'package:student_lite/User/Account_Setting.dart';
import 'package:student_lite/User/UserProfile.dart';
import 'package:student_lite/widgets/fab.dart';

import '../Model/Phong.dart';


class Screen_48 extends StatelessWidget {
  final List<Phong> favoriteList;

  Screen_48({required this.favoriteList});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onSearchSubmitted: (String ) {  },),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) =>UserProfile()),
                      // );
                    },
                    child: CircleAvatar(
                      radius: 30,
                      child: Text('K'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tạ Minh Khôi',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.black, size: 16),
                          SizedBox(width: 5),
                          Text('0.0 ★'),
                          SizedBox(width: 5),
                          Text('| chưa có đánh giá'),
                        ],
                      ),
                      Text('0 Người theo dõi | 0 Đang theo dõi'),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            Section(title: 'Quản lí', items: [
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Đơn thuê/mua phòng trọ, nhà trọ'),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => HomeScreen()), // đổi ở đây nha VA
                  // );
                },
              ),
            ]),
            Section(title: 'Tiện ích', items: [
              ListTile(
                leading: Icon(Icons.favorite, color: Colors.red),
                title: Text('Tin đăng đã lưu'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SavePost(favoriteList: favoriteList),), // đổi ở đây nha VA
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.bookmark),
                title: Text('Tìm kiếm đã lưu'),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => HomeScreen()), // đổi ở đây nha VA
                  // );
                },
              ),
              ListTile(
                leading: Icon(Icons.star, color: Colors.yellow),
                title: Text('Đánh giá từ tôi'),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => HomeScreen()), // đổi ở đây nha VA
                  // );
                },
              ),
              ListTile(
                leading: Icon(Icons.card_giftcard),
                title: Text('Ưu đãi của tôi'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Discount()), // đổi ở đây nha VA
                  );
                },
              ),
            ]),
            Section(title: '', items: [
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Cài đặt tài khoản'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountSetting()), // đổi ở đây nha VA
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.help_outline),
                title: Text('Trợ giúp'),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => HomeScreen()), // đổi ở đây nha VA
                  // );
                },
              ),
              ListTile(
                leading: Icon(Icons.feedback_outlined),
                title: Text('Đóng góp ý kiến'),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => HomeScreen()), // đổi ở đây nha VA
                  // );
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Đăng xuất'),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => HomeScreen()), // đổi ở đây nha VA
                  // );
                },
              ),
            ]),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0,0,155,0),
        child:
        fab(),
      ),
      bottomSheet: Stack(
        children: [
          MyHomePage(searchQuery: 'searchQuery',),
        ],
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final List<Widget> items;

  Section({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title.isNotEmpty)
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.grey[200],
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ...items,
      ],
    );
  }
}
