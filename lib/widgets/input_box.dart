import 'package:flutter/material.dart';

class InputBox {
  static Widget inputDecoration(
      String hintText, TextEditingController controller, Icon icon) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.start,
        focusNode: FocusNode(),
        decoration: InputDecoration(
          prefixIcon: icon,
          hintText: hintText,
          prefixStyle: hintText.isEmpty
              ? const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontFamily: 'Roboto-Light',
                )
              : const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Roboto-Light',
                ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
          filled: true,
          fillColor: Colors.white,
          alignLabelWithHint: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
          hintStyle: const TextStyle(
            fontSize: 12,
            fontFamily: 'Roboto-Light',
          ),
        ),
      ),
    );
  }
}
