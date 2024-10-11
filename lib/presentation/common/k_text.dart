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
    this.padding,
  });

  final String text;
  final TextStyle? textStyle;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Text(
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
      ),
    );
  }
}
