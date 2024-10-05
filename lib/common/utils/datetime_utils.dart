import 'dart:async';

import 'package:intl/intl.dart';
import 'package:rada360/common/extensions/extensions.dart';

class DateTimeUtils {
  /// Convert epoch in milliseconds to DateTime
  static DateTime getTimeStampFromEpoch(int epoch) {
    final timeStamp = DateTime.fromMillisecondsSinceEpoch(epoch);
    return timeStamp;
  }

  /// Convert DateTime to epoch string
  static String getEpochString(DateTime dt) {
    return dt.millisecondsSinceEpoch.toString();
  }

  /// Formats duration in milliseconds to xx:xx:xx format.
  static String durationFormatter(int milliSeconds) {
    var seconds = milliSeconds ~/ 1000;
    final hours = seconds ~/ 3600;
    seconds = seconds % 3600;
    var minutes = seconds ~/ 60;
    seconds = seconds % 60;
    final hoursString = hours >= 10
        ? '$hours'
        : hours == 0
            ? '00'
            : '0$hours';
    final minutesString = minutes >= 10
        ? '$minutes'
        : minutes == 0
            ? '00'
            : '0$minutes';
    final secondsString = seconds >= 10
        ? '$seconds'
        : seconds == 0
            ? '00'
            : '0$seconds';
    final formattedTime =
        '${hoursString == '00' ? '' : '$hoursString:'}$minutesString:$secondsString';
    return formattedTime;
  }

  static String getProcessTime(int seconds) {
    String str = "";
    final duration = Duration(seconds: seconds);

    int hours = duration.inHours;
    int mins = duration.inMinutes;
    int secs = duration.inSeconds;

    if (hours > 0) {
      str = str.suffixWith("$hours hrs");
    }

    if (mins > 0) {
      mins -= hours * 60;
      str = str.suffixWith("$mins mins");
    }

    if (secs > 0) {
      secs -= (hours * 60 * 60) + (mins * 60);
      str = str.suffixWith("$secs secs");
    }

    return str;
  }

  static final formatter = NumberFormat('#,###.#', 'en_US');

  static String printTotalDuration(int seconds) {
    final duration = Duration(seconds: seconds);
    String totalDurationStr = "";

    final hours = duration.inHours;
    final mins = duration.inMinutes;
    int remainSecs = 0;

    if (hours > 0) {
      totalDurationStr = hours.toString().suffixWith("giờ");
      remainSecs = seconds - (hours * 60 * 60);
    }
    if (mins > 0) {
      totalDurationStr =
          totalDurationStr.suffixWith(mins.toString().suffixWith("phút"));
      remainSecs = seconds - (mins * 60);
    }

    if (remainSecs > 0) {
      totalDurationStr =
          totalDurationStr.suffixWith(remainSecs.toString().suffixWith("giây"));
    }

    return totalDurationStr;
  }

  static String printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    final inHoursStr = twoDigits(duration.inHours) == "00"
        ? ""
        : "${twoDigits(duration.inHours)}:";
    return "$inHoursStr$twoDigitMinutes:$twoDigitSeconds";
  }

  static String getPosition(Duration duration) {
    return [duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(':');
  }

  static String getTimeDifferentBetween(DateTime from, DateTime to) {
    int seconds = to.difference(from).inSeconds;
    if (seconds < 60) {
      return "$seconds seconds";
    } else if (seconds >= 60 && seconds < 3600) {
      return '${from.difference(to).inMinutes.abs()} minutes';
    } else if (seconds >= 3600 && seconds < 86400) {
      return '${from.difference(to).inHours} hour';
    } else {
      return '${from.difference(to).inDays} day';
    }
  }

  static bool isGreaterThanMinute(
      {required DateTime from, required DateTime to, required int minute}) {
    if (from.difference(to).inMinutes.abs() > minute) {
      return true;
    }
    return false;
  }

  static DateTime convertToDateFromString(String input,
      {String inputFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"}) {
    // return DateFormat(inputFormat).parse(input, true).toLocal();
    return DateFormat(inputFormat).parse(input, true);
  }

  static String getDotDateString(DateTime dt) {
    String monthStr = "${dt.month}";
    String dayStr = "${dt.day}";

    if (dt.month < 10) {
      monthStr = "0$monthStr";
    }

    if (dt.day < 10) {
      dayStr = "0$dayStr";
    }

    return "$dayStr.$monthStr.${dt.year}";
  }

  static String getDotDateTimeString(
      {required DateTime dateTime, bool? isShortDateTime}) {
    String formatString =
        isShortDateTime != null ? "dd.MM.yyyy" : "dd.MM.yyyy HH:mm";
    final statisticDateString = DateFormat(formatString).format(dateTime);
    return statisticDateString;
  }

  static String getDashDateTimeString(
      {required DateTime dateTime, bool? isShortDateTime}) {
    String formatString =
        isShortDateTime != null ? "yyyy-MM-dd" : "yyyy-MM-dd HH:mm";
    final statisticDateString =
        DateFormat(formatString).format(dateTime.toLocal());
    return statisticDateString;
  }

  static String getTimeString() {
    DateTime dt = DateTime.now();
    String hour = "${dt.hour}";
    String min = "${dt.minute}";
    if (dt.hour < 10) {
      hour = "0$hour";
    }
    if (dt.minute < 10) {
      min = "0$min";
    }
    return "$hour:$min";
  }

  static String getTodayString({String? formatString}) {
    String formatStr = formatString ?? "dd.MM.yyyy";
    DateTime today = DateTime.now();
    final currentDateString = DateFormat(formatStr).format(today.toLocal());
    final weekday = translateWeekday(today.weekday);
    return "$weekday, $currentDateString";
  }

  static String translateWeekday(int day) {
    String weekDay = "";
    switch (day) {
      case 1:
        weekDay = "Thứ 2";
        break;
      case 2:
        weekDay = "Thứ 3";
        break;
      case 3:
        weekDay = "Thứ 4";
        break;
      case 4:
        weekDay = "Thứ 5";
        break;
      case 5:
        weekDay = "Thứ 6";
        break;
      case 6:
        weekDay = "Thứ 7";
        break;
      case 7:
        weekDay = "Chủ nhật";
        break;
    }
    return weekDay;
  }

  static String convertToDateString(String input,
      {String inputFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
      String outputFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"}) {
    String result = "";
    try {
      DateTime parseDate = DateFormat(inputFormat).parse(input, true);
      result = DateFormat(outputFormat).format(parseDate.toLocal());
    } catch (e) {
      result = "";
    }
    return result;
  }

  static String convertToDateTimeString(String input,
      {String inputFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
      String outputFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"}) {
    String result = "";
    try {
      DateTime parseDate = DateFormat(inputFormat).parse(input);
      result = DateFormat(outputFormat).format(parseDate.toLocal());
    } catch (e) {
      result = "";
    }
    return result;
  }

  static String getExpiredDt(DateTime dt) {
    int day = dt.day;
    int month = dt.month;

    String dayStr;
    String monthStr;

    if (day < 10) {
      dayStr = "$day".prefixWithNoSpace("0");
    } else {
      dayStr = "$day";
    }

    if (month < 10) {
      monthStr = "$month".prefixWithNoSpace("0");
    } else {
      monthStr = "$month";
    }

    return "$dayStr.$monthStr";
  }
}

class Debouncer {
  final int milliseconds;
  final Function()? action;
  Timer? _timer;

  Debouncer({required this.milliseconds, this.action});

  run(Function() action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
