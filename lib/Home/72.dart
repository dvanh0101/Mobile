import 'package:flutter/material.dart';
import 'package:student_lite/widgets/noti_room_box.dart';

class RoomListScreen extends StatefulWidget {
  const RoomListScreen({super.key});

  @override
  State<RoomListScreen> createState() => _HomeListState();
}

class _HomeListState extends State<RoomListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        scrolledUnderElevation: 7,
        elevation: 7,
        title: const Text('Student Life',
            style: TextStyle(
              fontSize: 32,
            ),
            textAlign: TextAlign.right),
        centerTitle: true,
        actions: [
          IconButton(
            padding: const EdgeInsets.all(2.67),
            icon: Image.asset('assets/icons/menu_icon.png',
                width: 26.67, height: 26.67),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          padding: const EdgeInsets.all(2.67),
          icon:
              Image.asset('assets/icons/Icon.png', width: 21.82, height: 21.82),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 10,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              height: 270,
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Danh sách các phòng tương tự tìm kiếm của bạn',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        InkWell(
                          onTap: () {},
                          child: const Row(
                            children: [
                              Text(
                                'Xem tất cả',
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff648DDB)),
                              ),
                              SizedBox(width: 5),
                              Icon(Icons.arrow_forward_ios,
                                  size: 16, color: Color(0xff648DDB)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NotiRoomBox.notiRoomBox('assets/images/image.png',
                          'Cho thuê căn hộ ở khu sala đầy đủ tiện nghi', '4,2 triệu/tháng', '3 ngày trước . Quận 2'),
                      NotiRoomBox.notiRoomBox('assets/images/image.png',
                          'Cho thuê phòng có bancol ', '4,2 triệu/tháng', '3 ngày trước . Quận 2'),
                      NotiRoomBox.notiRoomBox('assets/images/image.png',
                          'Cho thuê phòng trọ mini 2 người trung tâm Q.1', '4,2 triệu/tháng', '3 ngày trước . Quận 2'),
                    ],
                  )
                ],
              ),
            ),  
            Container(
              margin: const EdgeInsets.only(
                top: 10,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              height: 170,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10),
                
                              
              )      
            ),
          ],
        ),
      ),
    bottomNavigationBar: BottomNavigationBar(
    backgroundColor: Colors.white, // Màu nền của thanh điều hướng
      items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications),
        label: 'Notifications',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        label: 'Profile',
      ),
    ],
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
),
    );
  }
}
