import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_lite/utils/config-color.dart';
import 'package:student_lite/utils/config-text.dart';

class UserSupport extends StatelessWidget {
  void _showSupportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Column(
          children: [
            Icon(
              Icons.headset,
              color: Colors.blue,
              size: 40.0, // Thay đổi kích thước icon ở đây
            ),
            SizedBox(height: 20),
            Text("Trang Hỗ Trợ Chủ Trọ Và Khách Hàng",style: StyleConfigText.bodyTextBlack2,),
            SizedBox(height: 5),
          ],
        ),

        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                "Nếu bạn cần hỗ trợ đăng tin, vui lòng liên hệ số điện thoại bên dưới:",
                textAlign: TextAlign.center, // Căn giữa văn bản
                style: StyleConfigText.bodyTextRegular2, // Tùy chỉnh kích thước chữ nếu cần
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                    },
                    icon: Icon(Icons.phone, color: StyleConfigColor.text2), // Icon điện thoại
                    label: Text(
                      "Điện thoại: 0123456789",
                      style: StyleConfigText.bodyTextRegular3.copyWith(color: StyleConfigColor.text2),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: StyleConfigColor.warning, // Màu nền của nút
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Thực hiện hành động gọi điện thoại
                    },
                    icon: Icon(Icons.message, color: StyleConfigColor.text2), // Icon điện thoại
                    label: Text(
                      "Zalo: 0123456789",
                      style: StyleConfigText.bodyTextRegular3.copyWith(color: StyleConfigColor.text2),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: StyleConfigColor.blue, // Màu nền của nút
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Đóng dialog
            },
            child: Text("Đóng"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo AlertDialog')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showSupportDialog(context),
          child: Text('Mở Hỗ Trợ'),
        ),
      ),
    );
  }
}