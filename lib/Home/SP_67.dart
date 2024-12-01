import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:student_lite/widgets/AppBar.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'dart:async';
class sp_67 extends StatefulWidget {
  const sp_67({Key? key}) : super(key: key);

  @override
  _sp_67State createState() => _sp_67State();
}

class _sp_67State extends State<sp_67> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  final List<String> _images = [
    'assets/avt.jpg',
    'assets/avt.jpg',
    'assets/avt.jpg',
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (_controller.page != _images.length - 1) {
        _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      } else {
        _controller.jumpToPage(0);
      }
    });
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: CustomAppBar(onSearchSubmitted: (String ) {  },),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Container(
                height: 150,
                child: Stack(
                  children: [
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
                    Positioned(
                      bottom: 10,
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
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 3),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    height: 100,
                    width: 500,
                    'assets/avt.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                height: 130,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: ClipRRect(
                  child: Text(
                    'TRỞ THÀNH ĐỐI TÁC CỦA CHÚNG TÔI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: Colors.orangeAccent,
                                width: 3.0,
                              ),
                            ),
                            child: ClipRRect(
                                child: Image.asset('assets/images/CHCC.png')
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: ClipRRect(
                            child: Text(
                              'Căn hộ chung cư',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: Colors.orangeAccent,
                                width: 3.0,
                              ),
                            ),
                            child: ClipRRect(
                                child: Image.asset('assets/images/NhaO.png')
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: ClipRRect(
                            child: Text(
                              'Nhà ở',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: Colors.orangeAccent,
                                width: 3.0,
                              ),
                            ),
                            child: ClipRRect(
                                child: Image.asset('assets/images/PTro.png')
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: ClipRRect(
                            child: Text(
                              'Phòng trọ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 54, 0, 0),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: Colors.orangeAccent,
                                width: 3.0,
                              ),
                            ),
                            child: ClipRRect(
                                child: Image.asset('assets/images/MBKD.png')
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: ClipRRect(
                            child: Text(
                              'Mặt bằng kinh doanh',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
