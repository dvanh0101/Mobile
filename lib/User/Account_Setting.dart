import 'package:flutter/material.dart';
import 'package:student_lite/widgets/AppBar.dart';
class AccountSetting extends StatefulWidget {
  const AccountSetting({super.key});

  @override
  _AccountSettingState createState() => _AccountSettingState();
}
class _AccountSettingState extends State<AccountSetting> {
  int _selectedIndex = -1;
  void _changeTextColor(int index) {
    setState(() {
      if (_selectedIndex == index) {
        _selectedIndex = -1;
      } else {
        _selectedIndex = index;
      }
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 10.0, 0.0, 0.0),
            height: 10.0,
            color: Colors.grey,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 30.0, 0, 0),
                child: GestureDetector(
                  // onTap: () => _changeTextColor(0),
                  child: Text(
                    "Personal Information",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: GestureDetector(
                  onTap: () => _changeTextColor(0),
                  child: Text(
                    "Personal Information",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: _selectedIndex == 0 ? Colors.orange : Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: GestureDetector(
                  onTap: () => _changeTextColor(1),
                  child: Text(
                    "Social Media Links",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: _selectedIndex == 1 ? Colors.orange : Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: GestureDetector(
                  onTap: () => _changeTextColor(2),
                  child: Text(
                    "Account Settings",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: _selectedIndex == 2 ? Colors.orange : Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: GestureDetector(
                  onTap: () => _changeTextColor(3),
                  child: Text(
                    "Manage your login history",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: _selectedIndex == 3 ? Colors.orange : Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 20.0, 0.0, 0.0),
            height: 10.0,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
