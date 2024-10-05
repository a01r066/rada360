import 'package:flutter/material.dart';

abstract class BaseDialog {
  final BuildContext context;
  late AlertDialog dialog;

  BaseDialog({
    required this.context,
  });

  void show(
      {bool touchToDismiss = false, Color backgroundColor = Colors.black54}) {
    showDialog(
        context: context,
        barrierDismissible: touchToDismiss,
        barrierColor: backgroundColor,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => touchToDismiss, child: dialog);
        });
  }

  void dismiss() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}