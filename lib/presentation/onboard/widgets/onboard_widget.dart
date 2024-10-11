import 'package:flutter/material.dart';
import 'package:rada360/model/common/common.dart';
import 'package:rada360/presentation/common/k_text.dart';
import 'package:rada360/presentation/common/k_text_style.dart';

class OnboardWidget extends StatefulWidget {
  const OnboardWidget({
    super.key,
    required this.pageInfo,
    this.skipCallback,
  });

  final PageInfo pageInfo;
  final VoidCallback? skipCallback;

  @override
  State<OnboardWidget> createState() => _OnboardWidgetState();
}

class _OnboardWidgetState extends State<OnboardWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        KText(
          text: widget.pageInfo.title ?? "",
          textStyle: KTextStyle.titleTextStyle(),
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        KText(
          text: widget.pageInfo.description ?? "",
          textStyle: KTextStyle.descTextStyle(),
          maxLines: 4,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
