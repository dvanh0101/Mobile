import 'package:flutter/material.dart';
import 'package:student_lite/utils/config-color.dart';
import 'package:student_lite/utils/config-text.dart';
import 'package:student_lite/widgets/customsocialsigninbutton.dart';

class CustomSocialSigninOptions extends StatelessWidget {
  const CustomSocialSigninOptions({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomSocialSigninButton(
          imagePath: 'assets/images/apple.png', 
          text: "Login with Apple"),
        CustomSocialSigninButton(
          imagePath: 'assets/images/google.png', 
          text: "Login with Google"),
        CustomSocialSigninButton(
          imagePath: 'assets/images/facebook.png',
          text: "Login with Facebook"),
      ],
    );
  }
}
