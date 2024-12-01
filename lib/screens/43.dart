import 'package:flutter/material.dart';
import 'package:student_lite/widgets/AppBar.dart';

class LoginHistoryPage extends StatelessWidget {
  const LoginHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Phần AppBar
          CustomAppBar(onSearchSubmitted: (String ) {  },),

          // Phần nội dung
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Quản lý lịch sử đăng nhập
                  ManageLoginHistory(), // Tách riêng phần này

                  const SizedBox(height: 16),

                  // Lịch sử đăng nhập
                  LoginHistory(), // Tách riêng phần này
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 50),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}

// Tạo widget cho phần "Manage your login history"
class ManageLoginHistory extends StatelessWidget {
  const ManageLoginHistory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Manage your login history',
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 8),
        const Text(
          'Current Equipment',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        // Icon tùy chỉnh
        ListTile(
          leading: Opacity(
            opacity: 0.8, // Độ trong suốt của biểu tượng
            child: Container(
              width: 37, // Chiều rộng tùy chỉnh
              height: 54, // Chiều cao tùy chỉnh
              alignment: Alignment.center, // Căn giữa biểu tượng
              child: const Icon(
                Icons.phone_iphone,
                color: Colors.black54, // Màu biểu tượng
                size: 37, // Kích thước biểu tượng
              ),
            ),
          ),
          title: const Text('Iphone 12promax'),
        ),
        const Divider(),
      ],
    );
  }
}

// Tạo widget cho phần "Login history"
class LoginHistory extends StatelessWidget {
  const LoginHistory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Login history',
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 10),
        ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Căn giữa theo chiều dọc
            crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa theo chiều ngang
            children: const [
              Icon(
                Icons.phone_iphone,
                color: Colors.black54,
                size: 37,
              ),
              SizedBox(height: 8), // Khoảng cách giữa Icon và Text
              Text(
                'Iphone 12promax', // Nội dung text
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
