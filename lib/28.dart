import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Để theo dõi mục được chọn

  // Hàm thay đổi index khi người dùng chọn một item
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'Student Life',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              // Thực hiện hành động khi nhấn vào biểu tượng
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hình ảnh và giá
            Stack(
              children: [
                Image.asset(
                  'assets/image.png',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.favorite_border, color: Colors.black),
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.share, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 16,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    color: Colors.red,
                    child: Text(
                      '2 TRIỆU/THÁNG',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tiêu đề
                  Text(
                    'HOT! NHÀ TRỌ CÁCH ĐẠI HỌC CÔNG THƯƠNG TP. HCM 300M',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),

                  /*Row(
                    children: [
                      Text(
                        '2 Triệu Đồng',
                        style: TextStyle(
                          color: Colors.red,

                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),*/

                  // Địa chỉ
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.grey),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          '23 Chế Lan Viên, Phường Tây Thạnh, Quận Tân Phú, TP. Hồ Chí Minh',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),

                  // Thông tin cập nhật
                  Row(
                    children: [
                      Icon(Icons.update, color: Colors.grey),
                      SizedBox(width: 5),
                      Text(
                        'Cập nhật 1 tuần trước',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  // Đặc điểm bất động sản
                  Text(
                    'Đặc điểm bất động sản',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/img_giohang.png', width: 40, height: 40),
                            SizedBox(height: 8),
                            Text(
                              'CHO THUÊ',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/img_dientich.png', width: 40, height: 40),
                            SizedBox(height: 8),
                            Text(
                              '25M²',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  // Mô tả chi tiết
                  Text(
                    'Mô tả chi tiết',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Cho thuê phòng trọ có ban công, nằm ngay mặt tiền đường lớn giao thông thuận tiện, phòng có đầy đủ đồ gia dụng...',
                  ),
                  SizedBox(height: 16),

                  // Giá cả và nút đặt phòng
                  Row(
                    children: [
                      Text(
                        'Giá: 2.000.000VND/Tháng',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, // Nền xanh lá
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          textStyle: TextStyle(
                            color: Colors.white, // Chữ màu trắng
                            fontWeight: FontWeight.bold, // Chữ đậm
                          ),
                        ),
                        child: Text('Đặt phòng ngay'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
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
        selectedItemColor: Colors.blue, // Màu của mục được chọn
        unselectedItemColor: Colors.grey, // Màu của các mục chưa chọn
        backgroundColor: Colors.white, // Nền của bottom navigation
      ),
    );
  }
}
