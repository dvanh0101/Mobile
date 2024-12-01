import 'package:flutter/material.dart';
import 'package:student_lite/utils/config-color.dart';
import '../utils/config-text.dart';

class HelpBody extends StatelessWidget {
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
                'Trợ giúp',
                style: StyleConfigText.bodyTextBlack1,
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // T&C
                Container(
                  margin: EdgeInsets.only(bottom: 12.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: StyleConfigColor.gray, width: 1.0),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: ListTile(
                    title: Text(
                      'T&C',
                      style: StyleConfigText.bodyTextRegular3,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16.0),
                    onTap: () {
                      // Hành động khi T&C được nhấn
                    },
                  ),
                ),
                // Hướng dẫn sử dụng
                Container(
                  margin: EdgeInsets.only(bottom: 12.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: StyleConfigColor.gray, width: 1.0),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: ListTile(
                    title: Text(
                      'Hướng dẫn sử dụng',
                      style: StyleConfigText.bodyTextRegular3,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16.0),
                    onTap: () {
                      // Hành động khi Hướng dẫn sử dụng được nhấn
                    },
                  ),
                ),
                // Thông tin ứng dụng
                Container(
                  margin: EdgeInsets.only(bottom: 12.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: StyleConfigColor.gray, width: 1.0),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: ListTile(
                    title: Text(
                      'Thông tin ứng dụng',
                      style: StyleConfigText.bodyTextRegular3,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16.0),
                    onTap: () {
                      // Hành động khi Thông tin ứng dụng được nhấn
                    },
                  ),
                ),
                // Liên hệ
                Container(
                  margin: EdgeInsets.only(bottom: 12.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: StyleConfigColor.gray, width: 1.0),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: ListTile(
                    title: Text(
                      'Liên hệ',
                      style: StyleConfigText.bodyTextRegular3,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16.0),
                    onTap: () {
                      // Hành động khi Liên hệ được nhấn
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
