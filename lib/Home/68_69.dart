import 'package:flutter/material.dart';
import 'package:student_lite/widgets/AppBarSP.dart';
// import 'package:student_lite/widgets/CustomBottomNavigationBar.dart';
import 'package:student_lite/model/motel_model.dart';

class Screen_68_69 extends StatelessWidget {
  final Motel motel;

  Screen_68_69({required this.motel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarSP(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  // ListTile for user information
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey[300],
                      child: const Icon(Icons.person, color: Colors.white),
                    ),
                    title: const Text(
                      'User',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    subtitle: const Text(
                      'Đang hoạt động',
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                    trailing: PopupMenuButton<String>(
                      icon: const Icon(Icons.more_vert),
                      onSelected: (value) {
                        // Handle menu options
                        print('Selected: $value');
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          const PopupMenuItem<String>(
                            value: 'profile',
                            child: Text('Xem hồ sơ'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'block',
                            child: Text('Chặn người này'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'mute',
                            child: Text('Ẩn đoạn chat'),
                          ),
                        ];
                      },
                    ),
                  ),
                  // Hiển thị tên, hình ảnh và giá phòng
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          // Hình ảnh phòng
                          Container(
                            width: 100,
                            height: 100,
                            /*child: Image.network(
                               motel.imageUrl// Đường dẫn hình ảnh phòng
                              fit: BoxFit.cover,
                            ),*/
                          ),
                          // Thông tin phòng
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    motel.name, // Tên phòng
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    motel.address, // Địa chỉ
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    '${motel.price} VND', // Giá phòng
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // TextBox at the bottom
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              color: Colors.grey[200],
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Trò chuyện ngay',
                        hintStyle: TextStyle(color: Colors.grey[500], // Màu nhạt cho chữ gợi ý
                        ),
                        filled: true,
                        fillColor: Colors.white, // Màu nền của TextField
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0), // Padding bên trong TextField
                        suffixIcon: IconButton(
                          icon: Icon(Icons.send, color: Colors.blue), // Biểu tượng gửi tin nhắn
                          onPressed: () {
                            // Xử lý gửi tin nhắn
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
