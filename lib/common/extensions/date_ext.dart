import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:rada360/common/extensions/extensions.dart';
import 'package:rada360/common/utils/utils.dart';

extension DateTimeX on DateTime {
  String toDateTimeString() {
    return DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(this);
  }

  String _getPrefix(int num) {
    return num < 10 ? "$num".prefixWithNoSpace("0") : "$num";
  }

  String hrsMinShortDate() {
    final dt = toLocal();

    String timeString = "${_getPrefix(dt.hour)}:${_getPrefix(dt.minute)}";
    String dateString = "${_getPrefix(day)}.${_getPrefix(month)}.$year";

    return "$timeString - $dateString";
  }

  bool isToday() {
    final now = DateTime.now();
    return now.year == year && now.month == month && now.day == day;
  }

  bool isYesterday() {
    final now = DateTime.now();
    return now.year == year && now.month == month && now.day - 1 == day;
  }

  bool isGreaterMinutes({required int minute}) {
    final now = DateTime.now();
    if (kDebugMode) {
      print("difference minutes: ${now.difference(this).inMinutes.abs()}");
    }
    if (now.difference(this).inMinutes.abs() > minute) {
      return true;
    }
    return false;
  }
}
