import 'package:flutter/material.dart';
import 'package:student_lite/screens/account-body.dart';
import 'package:student_lite/screens/help-body.dart';
import 'package:student_lite/screens/setting-body.dart';
import 'package:student_lite/screens/turn-off-notifications-body.dart';
import 'package:student_lite/utils/config-color.dart';
import 'package:student_lite/utils/config-text.dart';
import 'hide-likes-body.dart';
import 'privacy-body.dart';
import 'active-status-body.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

enum SettingPageState {
  SettingBody,
  PrivacyBody,
  AccountBody,
  ActiveStatusBody,
  HideLikesBody,
  TurnOffNotificationsBody,
  HelpBody
}

class _SettingPageState extends State<SettingPage> {
  SettingPageState currentState = SettingPageState.SettingBody;
  String? selectedStatus; // The selected status to pass to the ActiveStatusBody

  // Function to navigate between different settings pages
  void navigateTo(SettingPageState state) {
    setState(() {
      currentState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget body;

    switch (currentState) {
      case SettingPageState.PrivacyBody:
        body = PrivacyBody(
          onStatusSelected: () => navigateTo(SettingPageState.ActiveStatusBody),
          selectedStatus: selectedStatus, // Pass the selected status
          onHideLikeSelected: () => navigateTo(SettingPageState.HideLikesBody),
          onTurnOffNotificationsSelected: () =>
              navigateTo(SettingPageState.TurnOffNotificationsBody),
        );
        break;
      case SettingPageState.AccountBody:
        body = AccountBody();
        break;
      case SettingPageState.ActiveStatusBody:
        body = ActiveStatusBody(
          selectedStatus: selectedStatus,
          onStatusChanged: (value) {
            setState(() {
              selectedStatus = value; // Update the selected status
            });
            navigateTo(SettingPageState
                .PrivacyBody); // Return to PrivacyBody after status change
          },
        );
        break;
      case SettingPageState.HelpBody:
        body = HelpBody();
        break;
      case SettingPageState.TurnOffNotificationsBody:
        body = TurnOffNotificationsBody(
          notifications: ['Pass Đồ Tân Phú', 'Chợ đồ cũ online'],
        );
      case SettingPageState.HideLikesBody:
        body = HideLikesBody();
        break;

      default:
        body = SettingBody(
          onPrivacySelected: () => navigateTo(SettingPageState.PrivacyBody),
          onAccountSelected: () => navigateTo(SettingPageState.AccountBody),
          onHelpBodySelected: () => navigateTo(SettingPageState.HelpBody),
        );
    }

    return Scaffold(
      backgroundColor: StyleConfigColor.backgroundwhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBar(
          backgroundColor: StyleConfigColor.backgroundwhite,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              if (currentState == SettingPageState.ActiveStatusBody ||
                  currentState == SettingPageState.HideLikesBody ||
                  currentState == SettingPageState.TurnOffNotificationsBody) {
                navigateTo(SettingPageState.PrivacyBody);
              } else if (currentState == SettingPageState.PrivacyBody ||
                  currentState == SettingPageState.AccountBody ||
                  currentState == SettingPageState.HelpBody) {
                navigateTo(SettingPageState.SettingBody);
              } else {
                Navigator.pop(context);
              }
            },
          ),
          flexibleSpace: _buildUserInfo(),
        ),
      ),
      body: body,
    );
  }

  Widget _buildUserInfo() {
    return Container(
      padding: EdgeInsets.only(top: 50, left: 16, right: 16),
      child: Row(
        children: [
          SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Họ và tên', style: StyleConfigText.bodyTextSemiBold3),
                Text('email@example.com',
                    style: StyleConfigText.bodyTextSemiBold4),
                SizedBox(height: 8),
                Text('Sở thích: Nghe nhạc, đọc sách',
                    style: StyleConfigText.bodyTextRegular4),
              ],
            ),
          ),
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/logo.png'),
          ),
        ],
      ),
    );
  }
}
