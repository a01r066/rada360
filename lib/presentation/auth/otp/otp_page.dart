import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rada360/common/utils/my_logger.dart';
import 'package:rada360/common/values/my_colors.dart';
import 'package:rada360/common/values/my_devices.dart';
import 'package:rada360/presentation/common/k_elevated_button.dart';
import 'package:rada360/presentation/common/k_text.dart';
import 'package:rada360/presentation/common/k_text_style.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  TextEditingController textEditingController = TextEditingController();

  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
    );
  }

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          KText(
            text: "Xác thực số điện thoại",
            textStyle: KTextStyle.titleTextStyle,
            textAlign: TextAlign.center,
          ),
          KText(
            text: "Vui lòng nhập mã OTP được gửi đến SĐT 0967 567 765",
            textStyle: KTextStyle.descriptionTextStyle,
            textAlign: TextAlign.center,
          ),
          _pinCode(),
          KElevatedButton(
            text: "Gửi lại OTP (00:30)",
            backgroundColor: MyColors.mainColor.withOpacity(.2),
            onPressed: () {
              MyLogger.info("resent otp");
            },
          ),
          KText(
            text: "Dùng số điện thoại khác",
            textStyle: KTextStyle.customTextStyle(
                fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget _pinCode() {
    final width = MyDevices.screenWidth;

    return Container(
      width: width * .7,
      margin: const EdgeInsets.symmetric(vertical: 32),
      child: Form(
        key: formKey,
        child: PinCodeTextField(
          appContext: context,
          pastedTextStyle: const TextStyle(),
          length: 4,
          // obscureText: false,
          // obscuringCharacter: '*',
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
            debugPrint("Completed");
          },
          // onTap: () {
          //   print("Pressed");
          // },
          onChanged: (value) {
            debugPrint(value);
            setState(() {
              currentText = value;
            });
          },
          beforeTextPaste: (text) {
            debugPrint("Allowing to paste $text");
            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //but you can show anything you want here, like your pop up saying wrong paste format or etc
            return true;
          },
        ),
      ),
    );
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
