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
          onPressed: () {},
          child: const Text(
            "Already have an account?",
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
