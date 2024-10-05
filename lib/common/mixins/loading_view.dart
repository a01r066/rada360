import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rada360/common/mixins/loading_dialog.dart';
import 'package:rada360/common/values/my_devices.dart';
import 'package:rada360/gen/assets.gen.dart';
import 'package:rada360/main/main.dart';

mixin LoadingViewMixin {
  bool _isShowingInfo = false;

  /* https://stackoverflow.com/questions/53615666/how-can-i-make-alertdialog-disappear-automatically-after-few-seconds-in-flutter
  showDialog(
      context: context,
      builder: (context) {
        return FutureBuilder(
          future: Future.delayed(dismissDuration).then((value) => true),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Navigator.of(context).pop();
            }
            return AlertDialog(
              content: Text(text),
            );
          },
        );
      },
    );
   */

  showKDialog(
    BuildContext context, {
    double? borderRadius,
    EdgeInsetsGeometry? contentPadding,
    Color? backgroundColor,
    bool? barrierDismissible,
    EdgeInsets? insetPadding,
    required Widget content,
  }) {
    showDialog(
        barrierDismissible: barrierDismissible ?? false,
        context: context,
        builder: (context) {
          return AlertDialog(
              insetPadding: insetPadding,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 0)),
              backgroundColor: backgroundColor,
              contentPadding: contentPadding,
              content: content);
        });
  }

  showDismissDialog(
    BuildContext context, {
    required String iconPath,
    required String title,
    required int seconds,
    VoidCallback? callback,
  }) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return FutureBuilder(
            future: Future.delayed(Duration(seconds: seconds))
                .then((value) => true),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Navigator.of(context).pop();
              }
              return AlertDialog(
                  shadowColor: Colors.transparent,
                  // insetPadding: EdgeInsets.symmetric(
                  //     horizontal: Device.screenWidth * 0.2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Colors.white10,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  content: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        iconPath,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12),
                        child: Text(
                          title,
                          style: const TextStyle(),
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ));
            },
          );
        }).then((value) {
      callback!();
    });
  }

  showLoadingAnimation() {
    return AlertDialog(
        elevation: 0.0,
        backgroundColor: Colors.black.withOpacity(0),
        insetPadding: const EdgeInsets.all(40),
        contentPadding: const EdgeInsets.all(40),
        titlePadding: const EdgeInsets.all(40),
        actionsPadding: const EdgeInsets.all(40),
        content: SizedBox(
          width: MyDevices.screenWidth,
          height: MyDevices.screenHeight / 2,
          child: Center(
            child: Lottie.asset(
              Assets.animations.msStarLoading,
              width: 80,
              animate: true,
              repeat: true,
              fit: BoxFit.contain,
            ),
          ),
        ));
  }

  showSnackBar(GlobalKey scaffoldKey, {required String msg}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final context = scaffoldKey.currentContext;
      if (context != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(msg),
        ));
      }
    });
  }

  void showLoading({String? msg}) {
    if (!_isShowingInfo) {
      LoadingDialog(context: mainNavigatorKey.currentContext)
          .show(touchToDismiss: false, backgroundColor: Colors.transparent);
    }
  }

  void dismissLoading({BuildContext? context}) {
    if (!_isShowingInfo) {
      LoadingDialog(context: mainNavigatorKey.currentContext).dismiss();
    }
  }
}
