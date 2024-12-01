import 'package:flutter/material.dart';
import 'package:student_lite/utils/config-color.dart';

import 'active-status-body.dart';
import '../utils/config-text.dart';
import 'hide-likes-body.dart';

class PrivacyBody extends StatefulWidget {
  final VoidCallback onStatusSelected; // Callback to navigate to ActiveStatusBody
  final String? selectedStatus; // The selected status to pass to ActiveStatusBody
  final VoidCallback onHideLikeSelected;
  final VoidCallback onTurnOffNotificationsSelected;

  PrivacyBody({required this.onStatusSelected, required this.selectedStatus, required this.onHideLikeSelected, required this.onTurnOffNotificationsSelected});

  @override
  _PrivacyBodyState createState() => _PrivacyBodyState();
}

class _PrivacyBodyState extends State<PrivacyBody> {
  String? selectedStatus; // Store the selected status
  bool _isNotificationEnabled = false;

  @override
  void initState() {
    super.initState();
    selectedStatus = widget.selectedStatus ?? 'Bất kỳ ai'; // Default status
  }

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
                'Quyền riêng tư',
                style: StyleConfigText.bodyTextBlack1,
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Đã tắt thông báo'),
            trailing: Switch(
              value: _isNotificationEnabled, // Set the current state of the switch
              onChanged: (value) {
                setState(() {
                  _isNotificationEnabled = value; // Update the state when the switch is toggled
                });
              },
              activeColor: StyleConfigColor.backgroundwhite, // Color of the switch thumb when it's on
              inactiveThumbColor: StyleConfigColor.gray, // Color of the switch thumb when it's off
              inactiveTrackColor: StyleConfigColor.backgroundwhite, // Color of the background track when the switch is off
              activeTrackColor: StyleConfigColor.blue,
            ),
            onTap: () {
              // Handle tap action
            },
          ),
          // Active Status Tile
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Trạng thái hoạt động'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min, // Ensures the icon and text are aligned
              children: [
                Container(
                  width: 80, // Set the fixed width for the text container
                  child: Text(
                    selectedStatus!,
                    overflow: TextOverflow.ellipsis, // Truncate text with ellipsis if it's too long
                    maxLines: 1, // Only one line of text will be shown
                    style: StyleConfigText.bodyTextRegular4,
                  ),
                ),
                Icon(Icons.chevron_right), // Chevron icon
              ],
            ),
            onTap: () {
              widget.onStatusSelected(); // Call the callback to show ActiveStatusBody
            },
          ),
          // Other menu items
          ListTile(
            leading: Icon(Icons.notifications_off),
            title: Text('Đã tắt thông báo'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              widget.onTurnOffNotificationsSelected();
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite_outlined),
            title: Text('Ẩn số lượt thích và chia sẻ'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              widget.onHideLikeSelected(); // Call the callback to show ActiveStatusBody
            },
          ),

          Divider(),
        ],
      ),
    );
  }
}
