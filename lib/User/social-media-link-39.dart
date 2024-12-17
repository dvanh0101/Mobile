import 'package:flutter/material.dart';
import 'package:student_lite/utils/config-color.dart';
import 'package:student_lite/utils/config-text.dart';
import 'package:student_lite/widgets/AnimatedBottomNavigationBar.dart';
import 'package:student_lite/widgets/AppBar.dart';
import 'package:student_lite/widgets/fab.dart';

class SocialMediaLink extends StatefulWidget {
  const SocialMediaLink({super.key});

  @override
  _SocialMediaLinkState createState() => _SocialMediaLinkState();
}

class _SocialMediaLinkState extends State<SocialMediaLink> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onSearchSubmitted: (String ) {  },),
      backgroundColor: StyleConfigColor.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Social Media Links',
                    style: StyleConfigText.bodyTextBlack1.copyWith(
                      color: StyleConfigColor.orangeDark,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'The information below is for authenticity only. Other users will not be able to see this information.',
                  style: StyleConfigText.bodyTextRegular1,
                ),
                const SizedBox(height: 20),
                _buildSocialLoginOptions(),
              ],
            ),
          ),
        ),
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

  Widget _buildSocialLoginOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSocialMediaSection("Facebook", "assets/images/facebook_icon.png", "Link to Facebook"),
        _buildSocialMediaSection("Google", "assets/images/google_icon.png", "Link to Google"),
        _buildSocialMediaSection("Apple ID", "assets/images/apple_icon.png", "Link to Apple"),
      ],
    );
  }

  Widget _buildSocialMediaSection(String title, String iconPath, String buttonText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            title,
            style: StyleConfigText.bodyTextBlack1,
          ),
        ),
        const SizedBox(height: 5),
        _buildSocialLoginButton(iconPath, buttonText),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildSocialLoginButton(String imagePath, String text) {
    return GestureDetector(
      onTap: () {
        // Xử lý khi nhấn nút
      },
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 390,
          height: 60,
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            border: Border.all(color: StyleConfigColor.text2Dark2),
            borderRadius: BorderRadius.circular(8),
            color: StyleConfigColor.text2,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: StyleConfigText.bodyTextRegular3,
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      imagePath,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
