import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeWidget extends StatefulWidget {
  const PinCodeWidget({
    super.key,
    required this.length,
    this.obscureText,
    this.obscuringCharacter,
    this.onChangedCallback,
    required this.onCompletedCallback,
  });

  final int length;
  final bool? obscureText;
  final String? obscuringCharacter;
  final Function(String)? onChangedCallback;
  final Function(String) onCompletedCallback;

  @override
  State<PinCodeWidget> createState() => _PinCodeWidgetState();
}

class _PinCodeWidgetState extends State<PinCodeWidget> {
  TextEditingController textEditingController = TextEditingController();

  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: PinCodeTextField(
        appContext: context,
        pastedTextStyle: const TextStyle(),
        length: widget.length,
        obscureText: widget.obscureText ?? false,
        obscuringCharacter: widget.obscuringCharacter ?? '●',
        // '\u00B7',
        // obscuringWidget: const FlutterLogo(
        //   size: 24,
        // ),
        blinkWhenObscuring: true,
        animationType: AnimationType.fade,
        validator: (v) {
          if (v!.isEmpty) {
            return "I'm from validator";
          } else {
            return null;
          }
        },
        pinTheme: PinTheme(
          // activeColor: Colors.white,
          // inactiveColor: Colors.white,
          activeFillColor: Colors.white,
          // selectedColor: Colors.white,
          selectedFillColor: Colors.white,
          inactiveFillColor: Colors.white,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          fieldHeight: 56,
          fieldWidth: 56,
        ),
        cursorColor: Colors.black,
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        errorAnimationController: errorController,
        controller: textEditingController,
        keyboardType: TextInputType.number,
        boxShadows: const [
          BoxShadow(
            offset: Offset(0, 1),
            color: Colors.black12,
            blurRadius: 10,
          )
        ],
        onCompleted: (v) {
          widget.onCompletedCallback(v);
        },
        // onTap: () {
        //   print("Pressed");
        // },
        onChanged: (value) {
          widget.onChangedCallback!(value);
        },
        beforeTextPaste: (text) {
          debugPrint("Allowing to paste $text");
          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
          //but you can show anything you want here, like your pop up saying wrong paste format or etc
          return true;
        },
      ),
    );
  }
}
