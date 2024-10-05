import 'dart:developer';
import 'package:flutter/foundation.dart';

class MyLogger {
  static void error(String message,
      {String tag = "--------------------> ERROR <--------------------"}) {
    if (kDebugMode) {
      log("$tag\n$message");
    }
  }

  static void info(String message,
      {String tag = "--------------------> INFO <--------------------"}) {
    if (kDebugMode) {
      log("$tag\n$message");
    }
  }
}
