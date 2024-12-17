import 'package:flutter/material.dart';
import 'package:student_lite/utils/config-color.dart';
import '../utils/config-text.dart';

class HideLikesBody extends StatefulWidget {
  @override
  _HideLikesBodyState createState() => _HideLikesBodyState();
}

class _HideLikesBodyState extends State<HideLikesBody> {
  bool isLikedHidden = true; // Biến trạng thái

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
                'Ẩn lượt thích',
                style: StyleConfigText.bodyTextBlack1,
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),  // Áp dụng padding cho tất cả phần tử bên trong
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    'Ẩn số lượt chia sẻ',
                    style: StyleConfigText.bodyTextSemiBold2,
                  ),
                  trailing: Switch(
                    value: isLikedHidden, // Sử dụng biến trạng thái
                    onChanged: (value) {
                      setState(() {
                        isLikedHidden = value; // Cập nhật trạng thái
                      });
                    },
                    activeColor: StyleConfigColor.backgroundwhite,
                    inactiveThumbColor: StyleConfigColor.gray,
                    inactiveTrackColor: StyleConfigColor.backgroundwhite,
                    activeTrackColor: StyleConfigColor.blue,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Column(
                    children: [
                      Text(
                        'Mục cài đặt này sẽ áp dụng với tài khoản của bạn.',
                        style: StyleConfigText.bodyTextRegular3,
                      ),
                      SizedBox(height: 18.0),  // Khoảng cách giữa các phần tử
                      Text(
                        'Trên trang của bạn, số lượt thích, lượt xem trên bài viết và chia sẻ của tài khoản khác sẽ bị ẩn.',
                        style: StyleConfigText.bodyTextRegular3,
                      ),
                    ],
                  ),
                ),

              ],
            ),
          )

        ],
      ),
    );
  }
}
