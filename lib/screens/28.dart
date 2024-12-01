import 'package:flutter/material.dart';
// import 'package:student_lite/widgets/CustomBottomNavigationBar.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Để theo dõi mục được chọn
  int _imageIndex = 0; // Để theo dõi hình ảnh hiện tại
  bool _isFavorite = false; // Để theo dõi trạng thái yêu thích

  // Danh sách hình ảnh
  final List<String> _imageList = [
    'assets/image1.png',
    'assets/image2.png',
    'assets/image3.png',
  ];

  // Hàm thay đổi index khi người dùng chọn một item
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Hàm thay đổi hình ảnh
  void _changeImage(int index) {
    setState(() {
      _imageIndex = index;
    });
  }

  // Hàm chuyển sang hình ảnh tiếp theo
  void _nextImage() {
    setState(() {
      _imageIndex = (_imageIndex + 1) % _imageList.length; // Lặp qua các hình ảnh
    });
  }

  // Hàm chuyển về hình ảnh trước
  void _previousImage() {
    setState(() {
      _imageIndex = (_imageIndex - 1 + _imageList.length) % _imageList.length; // Lặp qua các hình ảnh ngược lại
    });
  }

  // Xử lý sự kiện khi nhấn vào nút favorite
  void _onFavoritePressed() {
    setState(() {
      _isFavorite = !_isFavorite; // Chuyển trạng thái yêu thích
    });

    // Hiển thị thông báo
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(_isFavorite ? 'Đã thêm vào yêu thích!' : 'Đã bỏ yêu thích!')),
    );
  }

  // Xử lý sự kiện khi nhấn vào nút share
  void _onSharePressed() {
    setState(() {
      // Thực hiện thao tác khi nhấn nút chia sẻ
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Đang chia sẻ...')),
      );
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
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hình ảnh và nút chuyển hình
            Stack(
              children: [
                Image.asset(
                  _imageList[_imageIndex],
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Row(
                    children: [
                      // Nút favorite
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: Icon(
                            _isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: _isFavorite ? Colors.red : Colors.black,
                          ),
                          onPressed: _onFavoritePressed, // Gọi hàm khi nhấn
                        ),
                      ),
                      SizedBox(width: 8),
                      // Nút share
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: Icon(Icons.share, color: Colors.black),
                          onPressed: _onSharePressed, // Gọi hàm khi nhấn
                        ),
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
            // Các nút chuyển qua lại
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: _previousImage, // Chuyển về hình ảnh trước
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: _nextImage, // Chuyển sang hình ảnh tiếp theo
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
      // bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
