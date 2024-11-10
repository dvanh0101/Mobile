import 'package:flutter/material.dart';
import 'package:student_lite/utils/config-color.dart';
import 'package:student_lite/utils/config-text.dart';

class CustomAlreadyAccount extends StatelessWidget {
  //final VoidCallback onForgotPasswordPressed;

  const CustomAlreadyAccount({
    Key? key,
    //required this.onForgotPasswordPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {}, // Gọi callback khi nhấn vào
          child: const Text(
            "Already have an account?",
            style: TextStyle(
              color: Colors.blue, // Có thể tuỳ chỉnh theo style của bạn
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
