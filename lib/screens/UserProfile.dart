import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Background image and profile picture with Back button
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img_user_profile.png'), // Replace with your background image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/profile.jpg'), // Replace with your profile image path
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
            // Form fields
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  CustomTextField(label: 'Re-enter the name'),
                  CustomTextField(label: 'Re-enter Email'),
                  CustomTextField(label: 'Re-enter phone number'),
                  CustomTextField(label: 'Re-enter the address'),
                  CustomTextField(label: 'Re-enter gender'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Divider(),
            ListTile(
              title: Text('Booking details'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle booking details tap
              },
            ),
            ListTile(
              title: Text('Support center'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle support center tap
              },
            ),
            SizedBox(height: 20),
            // Submit and Log out buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle submit action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF00B398), // Màu nền Submit là #00B398
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Submit',
                          style: TextStyle(color: Colors.white), // Chữ màu trắng
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.arrow_forward_ios, color: Colors.white), // Biểu tượng màu trắng
                      ],
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      // Handle log out action
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Color(0xFF6E0EAA), // Đổi màu viền và chữ thành #6E0EAA
                      side: BorderSide(color: Color(0xFF6E0EAA)), // Viền Logout
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: Row(
                      children: [
                        Text('Log out'),
                        SizedBox(width: 5),
                        Icon(Icons.logout, size: 20, color: Color(0xFF6E0EAA)), // Biểu tượng màu tím
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;

  CustomTextField({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
