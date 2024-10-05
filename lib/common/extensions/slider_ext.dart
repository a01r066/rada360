import 'package:flutter/material.dart';

extension SliderX on Slider {
  /*
    child: ThemedSlider.withTheme(
    value: _mealRepartition,
    min: 0,
    max: _nbMeals.toDouble(),
    divisions: _nbMeals,
    onChanged: (newVal) {
      setState(() {
        _mealRepartition = newVal;
      });
    },
    themeData: const SliderThemeData(
      trackHeight: 16,
      tickMarkShape: RoundSliderTickMarkShape(tickMarkRadius: 6),
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16),
      thumbColor: Color(0xffffa938),
    ),
   */
  static Widget withTheme({
    Key? key,
    required double value,
    required Function(double) onChanged,
    Function(double)? onChangeStart,
    Function(double)? onChangeEnd,
    double min = 0.0,
    double max = 1.0,
    int? divisions,
    String? label,
    Color? activeColor,
    Color? inactiveColor,
    Color? thumbColor,
    MouseCursor? mouseCursor,
    String Function(double)? semanticFormatterCallback,
    FocusNode? focusNode,
    bool autofocus = false,
    required SliderThemeData themeData,
  }) {
    return SliderTheme(
      data: themeData,
      child: Slider(
        key: key,
        value: value,
        onChanged: onChanged,
        onChangeStart: onChangeStart,
        onChangeEnd: onChangeEnd,
        min: min,
        max: max,
        divisions: divisions,
        label: label,
        activeColor: activeColor,
        inactiveColor: inactiveColor,
        thumbColor: thumbColor,
        mouseCursor: mouseCursor,
        semanticFormatterCallback: semanticFormatterCallback,
        focusNode: focusNode,
        autofocus: autofocus,
      ),
    );
  }
}
