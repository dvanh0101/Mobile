import 'package:flutter/material.dart';
import 'package:student_lite/widgets/AnimatedBottomNavigationBar.dart';
import 'package:student_lite/widgets/AppBar.dart';
import 'package:student_lite/widgets/fab.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomAppBar(onSearchSubmitted: (String ) {  },),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(  // Wrap the content in SingleChildScrollView for better scrolling behavior
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'Change your password',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Center horizontally
                      crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
                      children: [
                        const Icon(
                          Icons.warning,
                          color: Colors.black54,
                          size: 37,
                        ),
                        const SizedBox(width: 13),
                        Flexible(
                          child: Text(
                            'Add your phone number and verify before doing this.',
                            style: const TextStyle(color: Colors.black54, fontSize: 20),
                            softWrap: true, // Allow text to wrap if it overflows
                            overflow: TextOverflow.visible, // Ensure the text is fully visible
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Current password field
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Current password',
                        labelStyle: TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),
                    // New password field
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'New password',
                        labelStyle: TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),
                    // Confirm new password field
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Confirm the new password',
                        labelStyle: TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    // Change password button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Logic for changing password
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          backgroundColor: const Color(0xFF32CD32),
                        ),
                        child: const Text(
                          'Change Password',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0,0,155,0),
        child:
        fab(),
      ),
      bottomSheet: Stack(
        children: [
          MyHomePage(searchQuery: 'searchQuery',),
        ],
      ),
    );
  }
}
