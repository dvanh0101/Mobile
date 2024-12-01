import 'package:flutter/material.dart';
import 'package:student_lite/utils/config-color.dart';
import '../utils/config-text.dart';

class TurnOffNotificationsBody extends StatelessWidget {
  final List<String> notifications; // Danh sách thông báo đã tắt

  // Constructor nhận danh sách thông báo
  TurnOffNotificationsBody({required this.notifications});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Center(
              child: Text(
                'Đã tắt thông báo',
                style: StyleConfigText.bodyTextBlack1,
              ),
            ),
          ),
          Divider(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Thêm một dòng thông báo cho mỗi phần tử trong danh sách notifications
                  for (var notification in notifications)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: StyleConfigColor.beigeLight1, // Màu nền cho container
                          border: Border.all(
                            color: StyleConfigColor.gray, // Màu của border
                            width: 1.0, // Độ dày của border
                          ),
                          borderRadius: BorderRadius.circular(8.0), // Bo góc của container
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 26.0), // Tăng kích thước khung
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Bạn đã tắt thông báo của ',
                                style: StyleConfigText.bodyTextRegular3,
                              ),
                              TextSpan(
                                text: notification,
                                style: StyleConfigText.bodyTextSemiBold2, // Tô đậm phần $notification
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
