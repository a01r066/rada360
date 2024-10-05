import 'package:flutter/material.dart';
import 'package:rada360/common/values/my_colors.dart';
import 'package:rada360/presentation/common/k_text.dart';

class KElevatedButton extends StatelessWidget {
  const KElevatedButton({
    super.key,
    required this.text,
    this.backgroundColor,
    this.onPressed,
  });

  final String text;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                  backgroundColor ?? MyColors.mainColor),
              padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 12))),
          onPressed: onPressed,
          child: KText(
            text: text,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          )),
    );
  }
}
