import 'package:flutter/material.dart';
import 'package:rada360/common/extensions/extensions.dart';

extension WidgetsX on List<Widget> {
  // 1.
  // double defaultHorizontalSpace = 8;

  // 2.
  static const double _defaultHorizontalSpace = 8;
  static const double _defaultVerticalSpace = 8;

  // 3.
  List<Widget> _spaced(
      {required double horizontalSpace, required double verticalSpace}) {
    // 4.
    return separated(SizedBox(width: horizontalSpace, height: verticalSpace));
  }

  List<Widget> horizontallySpaced({
    double horizontalSpace = _defaultHorizontalSpace,
  }) {
    return _spaced(horizontalSpace: horizontalSpace, verticalSpace: 0);
  }

  List<Widget> verticallySpaced({
    double verticalSpace = _defaultVerticalSpace,
  }) {
    return _spaced(horizontalSpace: 0, verticalSpace: verticalSpace);
  }
}
