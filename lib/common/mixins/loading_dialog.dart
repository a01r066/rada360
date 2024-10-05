import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rada360/common/mixins/base_dialog.dart';
import 'package:rada360/gen/assets.gen.dart';

class LoadingDialog extends BaseDialog {
  LoadingDialog({
    context,
  }) : super(context: context) {
    _build();
  }

  void _build() {
    dialog = AlertDialog(
      elevation: 0.0,
      backgroundColor: Colors.black.withOpacity(0),
      insetPadding: const EdgeInsets.all(40),
      contentPadding: const EdgeInsets.all(40),
      titlePadding: const EdgeInsets.all(40),
      actionsPadding: const EdgeInsets.all(40),
      content: Lottie.asset(
        Assets.animations.msStarLoading,
        width: 80,
        height: 80,
        animate: true,
        repeat: true,
        fit: BoxFit.contain,
      ),
    );
  }
}
