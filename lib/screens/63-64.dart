import 'package:flutter/material.dart';
import 'package:student_lite/utils/config-color.dart';
import '../utils/config-text.dart';

class ActivitiesAndNews extends StatefulWidget {
  const ActivitiesAndNews({super.key});

  @override
  State<ActivitiesAndNews> createState() => _ActivitiesAndNewsState();
}

class _ActivitiesAndNewsState extends State<ActivitiesAndNews> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: StyleConfigColor.background,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: StyleConfigColor.background,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,bottom: 20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Thêm ảnh trước dòng chữ
                          ClipOval(
                            child: Image.asset(
                              'assets/images/logo.png', // Đường dẫn tới ảnh
                              height: 60, // Chiều cao và chiều rộng bằng nhau
                              width: 60,
                              fit: BoxFit.cover, // Đảm bảo ảnh vừa khít
                            ),
                          ),

                          const SizedBox(width: 10), // Khoảng cách giữa ảnh và text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start, // Căn chữ theo chiều ngang
                            children: [
                              Text(
                                'Tên',
                                style: StyleConfigText.bodyTextRegular2.copyWith(
                                ),
                              ),
                              const SizedBox(height: 5), // Khoảng cách giữa hai dòng
                              Text(
                                '+ Tạo đối tác',
                                style: StyleConfigText.bodyTextRegular3.copyWith(
                                  color: StyleConfigColor.blue, // Màu sắc cho dòng tạo đối tác
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: StyleConfigColor.background,
                    child: TabBar(
                      isScrollable: false, // Đảm bảo TabBar chiếm toàn bộ màn hình
                      labelPadding: const EdgeInsets.symmetric(horizontal: 0), // Loại bỏ padding giữa các tab
                      labelColor: StyleConfigColor.text,
                      unselectedLabelColor: StyleConfigColor.gray,
                      indicator: BoxDecoration(
                        color: StyleConfigColor.text2Dark2, // Màu nền cho tab được chọn
                        border: Border(
                          bottom: BorderSide(
                            color: StyleConfigColor.orangeDark1, // Màu của đường kẻ
                            width: 3, // Độ dày của đường kẻ
                          ),
                        ),
                      ),
                      tabs: [
                        Tab(
                          child: Center(
                            child: Text(
                              'HOẠT ĐỘNG',
                              style: StyleConfigText.bodyTextRegular3,
                            ),
                          ),
                        ),
                        Tab(
                          child: Center(
                            child: Text(
                              'TIN MỚI',
                              style: StyleConfigText.bodyTextRegular3,
                            ),
                          ),
                        ),
                      ],
                    ),



                  ),
                ],
              ),
            ),
          ),

        ),
        body: TabBarView(
          children: <Widget>[
            Center(child: Text('Bạn chưa có hoạt động nào',style: StyleConfigText.bodyTextRegular4)),
            Center(child: Text('Chúng tui hiện chưa có cập nhật nào.\nQuý khách hàng vui lòng kiểm tra lại sau',style: StyleConfigText.bodyTextRegular4)),
          ],
        ),
      ),
    );
  }
}

