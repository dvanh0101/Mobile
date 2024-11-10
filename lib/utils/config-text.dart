import 'package:flutter/material.dart';

class StyleConfigText {
  static const TextStyle _baseTextStyle = TextStyle(
    height: 1,
  );

  static TextStyle title1 = _baseTextStyle.copyWith(
    fontSize: 32,
    fontFamily: 'Manrope-Black',
  );

  static TextStyle title2 = _baseTextStyle.copyWith(
    fontSize: 28,
    fontFamily: 'Manrope-Black',
  );

  static TextStyle title3 = _baseTextStyle.copyWith(
    fontSize: 24,
    fontFamily: 'Manrope-Black',
  );

  static TextStyle title4 = _baseTextStyle.copyWith(
    fontSize: 24,
    fontFamily: 'Manrope-SemiBold',
  );

  static TextStyle title5 = _baseTextStyle.copyWith(
    fontSize: 20,
    fontFamily: 'Manrope-SemiBold',
  );

  static TextStyle bodyTextBlack1 = _baseTextStyle.copyWith(
    fontSize: 20,
    fontFamily: 'Manrope-Black',
  );

  static TextStyle bodyTextBlack2 = _baseTextStyle.copyWith(
    fontSize: 18,
    fontFamily: 'Manrope-Black',
  );

  static TextStyle bodyTextBlack3 = _baseTextStyle.copyWith(
    fontSize: 16,
    fontFamily: 'Manrope-Black',
  );

  static TextStyle bodyTextSemiBold1 = _baseTextStyle.copyWith(
    fontSize: 20,
    fontFamily: 'Manrope-SemiBold',
  );

  static TextStyle bodyTextSemiBold2 = _baseTextStyle.copyWith(
    fontSize: 18,
    fontFamily: 'Manrope-SemiBold',
  );

  static TextStyle bodyTextSemiBold3 = _baseTextStyle.copyWith(
    fontSize: 16,
    fontFamily: 'Manrope-SemiBold',
  );

  static TextStyle bodyTextRegular1 = _baseTextStyle.copyWith(
    fontSize: 20,
    fontFamily: 'Manrope-Regular',
  );

  static TextStyle bodyTextRegular2 = _baseTextStyle.copyWith(
    fontSize: 18,
    fontFamily: 'Manrope-Regular',
  );

  static TextStyle bodyTextRegular3 = _baseTextStyle.copyWith(
    fontSize: 16,
    fontFamily: 'Manrope-Regular',
  );

  // Các phong cách nút và chú thích
  static TextStyle buttonSystem = _baseTextStyle.copyWith(
    fontSize: 20,
    fontFamily: 'Manrope-Medium',
  );

  static TextStyle subtitleSystem = _baseTextStyle.copyWith(
    fontSize: 18,
    fontFamily: 'Manrope-SemiBold',
  );

  static TextStyle captionSystem = _baseTextStyle.copyWith(
    fontSize: 14,
    fontFamily: 'Manrope-Regular',
  );
}
