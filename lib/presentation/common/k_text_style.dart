import 'package:flutter/material.dart';

class KTextStyle {
  static TextStyle get titleTextStyle {
    return const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      letterSpacing: -.2,
      height: 1.5,
      wordSpacing: -2,
    );
  }

  static TextStyle get descriptionTextStyle {
    return const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      letterSpacing: -.2,
      height: 1.5,
      wordSpacing: -2,
    );
  }

  static TextStyle customTextStyle({
    double? fontSize,
    FontWeight? fontWeight,
    double? height,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: -.2,
      height: height,
      // wordSpacing: -2,
    );
  }
}
