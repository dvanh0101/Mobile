import 'package:flutter/material.dart';
import 'package:student_lite/Home/74.dart';
import 'package:student_lite/Home/rating-73.dart';
import 'package:student_lite/utils/config-color.dart';
import 'package:student_lite/utils/config-text.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:student_lite/widgets/AnimatedBottomNavigationBar.dart';
import 'package:student_lite/widgets/appbar_sp.dart';
import 'package:student_lite/widgets/fab.dart';

class Page30 extends StatefulWidget {
  const Page30({Key? key}) : super(key: key);

  @override
  _Page30State createState() => _Page30State();
}

class _Page30State extends State<Page30> {
  late GoogleMapController mapController;

  final LatLng _center =
      const LatLng(10.8231, 106.6297); //Toa do trung tam ban do

// Khai báo ScrollController để điều khiển cuộn
  final ScrollController _scrollController = ScrollController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Hàm cuộn sang phải
  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 200, // Cuộn thêm 200 pixel sang phải
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // Hàm cuộn sang trái
  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 200, // Cuộn thêm 200 pixel sang trái
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSp(),
      body: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200.0,
                        child: GoogleMap(
                          onMapCreated: _onMapCreated,
                          initialCameraPosition: CameraPosition(
                            target: _center,
                            zoom: 11.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            //Ho so nguoi dung
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: StyleConfigColor.text2Dark2,
                                    //child: const Icon(Icons.person, size: 40),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "User",
                                      style: StyleConfigText.bodyTextRegular2,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.star,
                                            color: StyleConfigColor.secondaryLight2,
                                            size: 16),
                                        const Text("5.0 (10)"),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Image.asset('images/hand.png'),
                                SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: StyleConfigColor.secondary,
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "Đối tác",
                                      style: StyleConfigText.bodyTextRegular2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),

                            //Nut goi va nhan tin
                            Row(
                              children: [
                                Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: StyleConfigColor.succeed,
                                        padding: EdgeInsets.symmetric(vertical: 20),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              8), // Điều chỉnh bo góc
                                        ),
                                      ),
                                      child: Stack(
                                        alignment:
                                        Alignment.center, // Đặt text ở giữa nút
                                        children: [
                                          Align(
                                            alignment: Alignment
                                                .centerLeft, // Căn chỉnh icon sang trái
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 25.0),
                                              child: Image.asset(
                                                'images/phone_call.png',
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment
                                                .center, // Căn chỉnh text ở giữa nút
                                            child: Text(
                                              "Bấm để gọi SĐT 094367****",
                                              style: StyleConfigText.bodyTextRegular2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                            const SizedBox(height: 10),

                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: StyleConfigColor.text2Dark2,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 20), //Them khoang trong
                                      alignment: Alignment
                                          .center, //Can giua noi dung voi phan icon ben trai
                                      side: BorderSide(
                                          color: StyleConfigColor
                                              .text2Dark4), //Duong vien
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ), // Điều chỉnh bo góc, giá trị thấp hơn làm góc bớt cong
                                    ),
                                    child: Stack(
                                      alignment:
                                      Alignment.center, // Đặt text ở giữa nút
                                      children: [
                                        Align(
                                          alignment: Alignment
                                              .centerLeft, // Căn chỉnh icon sang trái
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.only(left: 25.0),
                                            child: Image.asset(
                                              'images/message.png',
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment
                                              .center, // Căn chỉnh text ở giữa nút
                                          child: Text(
                                            "Chat",
                                            style: StyleConfigText.bodyTextRegular2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // child: OutlinedButton.icon(
                                  //   onPressed: () {},
                                  //   icon: Padding(
                                  //     padding: const EdgeInsets.only(left: 25.0),
                                  //     child: Image.asset('images/message.png'),
                                  //   ),
                                  //   label: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.center,
                                  //     children: [
                                  //       Text(
                                  //         'Chat',
                                  //         style: StyleConfigText.bodyTextRegular2,
                                  //         textAlign: TextAlign.center,
                                  //       ),
                                  //     ],
                                  //   ),
                                  //   style: OutlinedButton.styleFrom(
                                  //     backgroundColor: StyleConfigColor.text2Dark2,
                                  //     padding: EdgeInsets.symmetric(
                                  //         vertical: 20), //Them khoang trong
                                  //     alignment: Alignment
                                  //         .center, //Can giua noi dung voi phan icon ben trai
                                  //     side: BorderSide(
                                  //         color: StyleConfigColor
                                  //             .text2Dark4), //Duong vien
                                  //     shape: RoundedRectangleBorder(
                                  //       borderRadius: BorderRadius.circular(
                                  //           8), // Điều chỉnh bo góc, giá trị thấp hơn làm góc bớt cong
                                  //     ),
                                  //   ),
                                  // ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        onPressed: _scrollLeft,
                                        icon: Icon(Icons.arrow_back)),
                                    Expanded(
                                      child: SingleChildScrollView(
                                          controller:
                                          _scrollController, // Gắn controller vào SingleChildScrollView
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Chip(
                                                  label: Text(
                                                      "Phòng này còn cho thuê không ạ?"),
                                                  backgroundColor:
                                                  StyleConfigColor.text2Dark2,
                                                ),
                                              ),
                                              Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                                  child: Chip(
                                                    label: Text("Còn phòng không ạ?"),
                                                    backgroundColor:
                                                    StyleConfigColor.text2Dark2,
                                                  )),
                                            ],
                                          )),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.arrow_forward),
                                      onPressed: _scrollRight, // Khi bấm mũi tên phải
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),

                            //Chi tiet phong
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: StyleConfigColor.text2Dark1,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Row(children: [
                                    // Image.asset(
                                    //     'images/hand_gray.png'), // Tạo độ mờ cho ảnh
                                    const SizedBox(width: 10),
                                    Text(
                                      'Là đối tác của SCHOOL LIFE',
                                      style: StyleConfigText.bodyTextRegular2,
                                    ),
                                  ]),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      // Image.asset('images/check.png'),
                                      // const SizedBox(width: 10),
                                      Text(
                                        "Cam kết xác minh thông tin cá nhân Môi giới",
                                        style: StyleConfigText.bodyTextRegular2,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      // Image.asset('images/check.png'),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Cam kết đảm bảo chất lượng tư vấn",
                                        style: StyleConfigText.bodyTextRegular2,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center, // Căn chỉnh Row ở giữa theo chiều ngang
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            //Xu ly hoat dong
                                          },
                                          child: const Text("Tìm hiểu thêm"),
                                        ),
                                        Icon(Icons.arrow_downward),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ReviewStatisticsScreen(motelId: 'Motel01'),
                      CommentValuation(),
                    ],
                  ),
              ),
            ),
          ],
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
