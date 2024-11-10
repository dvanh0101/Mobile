import 'package:flutter/material.dart';
import 'package:student_lite/utils/config-color.dart';
import 'package:student_lite/utils/config-text.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? errorText;
  final bool hasError;
  final IconData icon;
  final bool obscureText;
  final Widget? suffixIcon;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.errorText,
    this.hasError = false,
    required this.icon,
    required this.obscureText,
    this.suffixIcon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: StyleConfigText.bodyTextRegular1),
        Container(
          margin: const EdgeInsets.only(top: 5),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: hasError
                  ? StyleConfigColor.warning
                  : StyleConfigColor.textLight6,
              width: 1.5,
            ),
            color: StyleConfigColor.text2,
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return errorText;
              }
              return null;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(icon, color: StyleConfigColor.gray),
              suffixIcon: suffixIcon,
            ),
          ),
        ),
        if (hasError || errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: Text(
              errorText ?? '',
              style: TextStyle(color: StyleConfigColor.warning),
            ),
          ),
      ],
    );
  }
}
