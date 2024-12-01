import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/config-text.dart';

class SettingBody extends StatelessWidget {
  final Function onPrivacySelected;
  final Function onAccountSelected;
  final Function onHelpBodySelected;

  SettingBody({required this.onPrivacySelected, required this.onAccountSelected, required this.onHelpBodySelected});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Center(
              child: Text('Cài đặt', style: StyleConfigText.bodyTextBlack1),
            ),
          ),
          Divider(),

          // Danh sách các mục cài đặt
          ListTile(
            leading: Icon(Icons.bookmark),
            title: Text('Đã lưu'),
            onTap: () {
              // Xử lý sự kiện
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Lượt thích của bạn'),
            onTap: () {
              // Xử lý sự kiện
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Quyền riêng tư'),
            onTap: () {
              onPrivacySelected(); }
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Tài khoản'),
            onTap: () {
              onAccountSelected();
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Trợ giúp'),
            onTap: () {
              onHelpBodySelected();
            },
          ),
          Divider(),

          // Đăng xuất
          Center(
            child: TextButton(
              onPressed: () {
                // Xử lý đăng xuất
              },
              child: Text(
                'Đăng xuất',
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}