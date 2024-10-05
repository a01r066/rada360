import 'dart:core' as core;
import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:rada360/common/utils/log.dart';

Future<T> elapsedFuture<T>(
  Future<T> future, {
  String? prefix,
}) async {
  final Stopwatch stopwatch = Stopwatch()..start();
  final T result = await future;
  stopwatch.stop();
  Log.d('${prefix != null ? '$prefix: ' : ''}${stopwatch.elapsed}');
  return result;
}

void print(core.Object object) {
  if (kDebugMode) {
    core.print(object);
  }
}
