import 'package:flutter/material.dart';
import 'package:student_lite/utils/config-color.dart';
import 'package:student_lite/utils/config-text.dart';

class CustomSignInButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final VoidCallback validateForm;
  final bool isLoginFailed;

  const CustomSignInButton({
    Key? key,
    required this.formKey,
    required this.validateForm,
    required this.isLoginFailed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * .3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: StyleConfigColor.primary,
      ),
      child: TextButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            // login();
            validateForm();
          }
          validateForm();
        },
        child: Text("Sign up",
            style:
                StyleConfigText.title3.copyWith(color: StyleConfigColor.text2)),
      ),
    );
  }
}
