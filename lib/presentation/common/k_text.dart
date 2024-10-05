import 'package:flutter/material.dart';
import 'package:rada360/gen/fonts.gen.dart';

class KText extends StatelessWidget {
  const KText({
    super.key,
    required this.text,
    this.textStyle,
    this.maxLines,
    this.overflow,
    this.textAlign,
  });

  final String text;
  final TextStyle? textStyle;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle ??
          const TextStyle(
            fontSize: 20,
            fontFamily: FontFamily.sVNGilroy,
            fontWeight: FontWeight.w400,
          ),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
