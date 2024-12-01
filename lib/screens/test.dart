import 'package:flutter/material.dart';
import 'dart:async';

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  final List<String> _images = [
    'assets/avt.jpg', // Thêm hình ảnh của bạn
    'assets/avt.jpg',
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (_controller.page != _images.length - 1) {
        _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      } else {
        _controller.jumpToPage(0); // Trở về trang đầu khi hết
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image Slider
        Container(
          height: 300, // Chiều cao của slider
          child: Stack(
            children: [
              // PageView chứa các hình ảnh
              PageView.builder(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _images.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    _images[index],
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  );
                },
              ),

              // Dấu chấm chỉ báo ở trong PageView
              Positioned(
                bottom: 10, // Điều chỉnh vị trí dấu chấm từ dưới lên
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _images.length,
                        (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? Colors.blue // Chấm hiện tại có màu xanh
                            : Colors.grey, // Các chấm còn lại có màu xám
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
