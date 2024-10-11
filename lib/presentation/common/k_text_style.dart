import 'package:flutter/material.dart';
import 'package:rada360/common/values/my_colors.dart';
import 'package:rada360/gen/fonts.gen.dart';

class KTextStyle {
  static TextStyle titleTextStyle() {
    return const TextStyle(
      fontFamily: FontFamily.sVNGilroy,
      color: MyColors.titleTextColor,
      fontSize: 32,
      fontWeight: FontWeight.w700,
      letterSpacing: -.2,
      height: 1.5,
      wordSpacing: -2,
    );
  }

  static TextStyle descTextStyle() {
    return const TextStyle(
      fontFamily: FontFamily.sVNGilroy,
      color: MyColors.descTextColor,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      letterSpacing: -.2,
      height: 1.5,
      wordSpacing: -2,
    );
  }

  static TextStyle captionTextStyle({Color? textColor}) {
    return TextStyle(
      fontFamily: FontFamily.sVNGilroy,
      color: textColor ?? MyColors.titleTextColor,
      fontSize: 16,
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
      fontFamily: FontFamily.sVNGilroy,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: -.2,
      height: height,
      // wordSpacing: -2,
    );
  }
}
