import 'package:flutter/material.dart';
import 'package:student_lite/utils/config-color.dart';
import 'package:student_lite/utils/config-text.dart';

class AccountBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tiêu đề
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Center(
              child: Text(
                'Tài khoản',
                style: StyleConfigText.bodyTextBlack1,
              ),
            ),
          ),
          Divider(),

          // Danh sách tùy chọn tài khoản
          ListTile(
            title: Text('Lời nhắc nghỉ ngơi'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Xử lý khi bấm
            },
          ),
          ListTile(
            title: Text('File phương tiện'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Xử lý khi bấm
            },
          ),
          ListTile(
            title: Text('Trợ năng'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Xử lý khi bấm
            },
          ),
          ListTile(
            title: Text('Vô hiệu hoặc xoá'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Xử lý khi bấm
            },
          ),
          ListTile(
            title: Text('Mật khẩu và bảo mật'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Xử lý khi bấm
            },
          ),
          ListTile(
            title: Text('Thông tin cá nhân'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Xử lý khi bấm
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
