import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rada360/common/utils/my_logger.dart';
import 'package:rada360/common/values/my_colors.dart';
import 'package:rada360/common/values/my_devices.dart';
import 'package:rada360/config/routes.dart';
import 'package:rada360/config/services_locator.dart';
import 'package:rada360/model/common/app_state_status.dart';
import 'package:rada360/presentation/auth/otp/otp_cubit.dart';
import 'package:rada360/presentation/auth/widgets/pin_code_widget.dart';
import 'package:rada360/presentation/common/k_elevated_button.dart';
import 'package:rada360/presentation/common/k_text.dart';
import 'package:rada360/presentation/common/k_text_style.dart';
import 'package:rada360/services/remote/network/endpoints.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({
    super.key,
    required this.phone,
  });

  final String phone;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  OtpCubit otpCubit = OtpCubit(apiRepositories: locator.get());

  Timer? timer;
  Timer? remainTimer;
  int expiredCounter = 10;
  int counter = 0;
  int remainCounter = 10;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      counter++;
      if (counter == expiredCounter) {
        otpCubit.checkIsOtpExpired(isExpired: true);
        t.cancel();
      }
    });
    _getRemainTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    remainTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => otpCubit,
      child: BlocConsumer<OtpCubit, OtpState>(
        listener: (context, state) {
          if (state.status == AppStateStatus.done) {
            MyLogger.info(state.dataResponse.toString());
            final response = state.dataResponse;
            bool isPhoneExist = response?.data?['is_phone_exist'] ?? false;
            if (isPhoneExist) {
              Navigator.of(context)
                  .pushNamed(RoutePaths.signInPage, arguments: widget.phone);
            } else {
              Navigator.of(context)
                  .pushNamed(RoutePaths.registerPage, arguments: widget.phone);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: _buildBody(),
          );
        },
      ),
    );
  }

  int _getRemainTimer() {
    remainTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (remainCounter > 0) {
        setState(() {
          remainCounter--;
        });
      } else {
        t.cancel();
      }
    });
    return remainCounter;
  }

  _buildBody() {
    final isExpired = otpCubit.state.isExpired ?? false;
    final phone = widget.phone;
    final errorMessage = otpCubit.state.errorMessage ?? "";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          KText(
            text: "Xác thực số điện thoại",
            textStyle: KTextStyle.titleTextStyle(),
            textAlign: TextAlign.center,
          ),
          KText(
            text: "Vui lòng nhập mã OTP được gửi đến SĐT $phone",
            textStyle: KTextStyle.descTextStyle(),
            textAlign: TextAlign.center,
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          // _pinCode(),
          SizedBox(
            width: MyDevices.screenWidth * .7,
            child: PinCodeWidget(
                length: 4,
                onChangedCallback: (value) {},
                onCompletedCallback: (value) {
                  final data = {"phone": phone, "code": value};
                  otpCubit.verifyOtp(endpoint: Endpoints.verifyOtp, data: data);
                }),
          ),
          errorMessage.isNotEmpty
              ? KText(
                  text: errorMessage,
                  textStyle: KTextStyle.captionTextStyle(
                      textColor: const Color(0xFFE64646)),
                  textAlign: TextAlign.center,
                )
              : const SizedBox.shrink(),
          KElevatedButton(
            text:
                'Gửi lại OTP ${remainCounter == 0 ? "" : "${remainCounter}s"}',
            backgroundColor: isExpired
                ? MyColors.buttonColor
                : MyColors.buttonColor.withOpacity(.2),
            onPressed: isExpired
                ? () {
                    MyLogger.info("resent otp");
                  }
                : () {},
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: KText(
              text: "Dùng số điện thoại khác",
              textStyle: KTextStyle.captionTextStyle(
                  textColor: const Color(0xFFB8B8B8)),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _pinCode() {
  //   final width = MyDevices.screenWidth;
  //
  //   return Container(
  //     width: width * .7,
  //     margin: const EdgeInsets.symmetric(vertical: 32),
  //     child: Form(
  //       key: formKey,
  //       child: PinCodeTextField(
  //         appContext: context,
  //         pastedTextStyle: const TextStyle(),
  //         length: 4,
  //         // obscureText: false,
  //         // obscuringCharacter: '*',
  //         // obscuringWidget: const FlutterLogo(
  //         //   size: 24,
  //         // ),
  //         blinkWhenObscuring: true,
  //         animationType: AnimationType.fade,
  //         validator: (v) {
  //           if (v!.isEmpty) {
  //             return "I'm from validator";
  //           } else {
  //             return null;
  //           }
  //         },
  //         pinTheme: PinTheme(
  //           // activeColor: Colors.white,
  //           // inactiveColor: Colors.white,
  //           activeFillColor: Colors.white,
  //           // selectedColor: Colors.white,
  //           selectedFillColor: Colors.white,
  //           inactiveFillColor: Colors.white,
  //           shape: PinCodeFieldShape.box,
  //           borderRadius: BorderRadius.circular(10),
  //           fieldHeight: 56,
  //           fieldWidth: 56,
  //         ),
  //         cursorColor: Colors.black,
  //         animationDuration: const Duration(milliseconds: 300),
  //         enableActiveFill: true,
  //         errorAnimationController: errorController,
  //         controller: textEditingController,
  //         keyboardType: TextInputType.number,
  //         boxShadows: const [
  //           BoxShadow(
  //             offset: Offset(0, 1),
  //             color: Colors.black12,
  //             blurRadius: 10,
  //           )
  //         ],
  //         onCompleted: (v) {
  //           debugPrint("Completed");
  //           Navigator.of(context).pushNamed(RoutePaths.registerSignInPage);
  //         },
  //         // onTap: () {
  //         //   print("Pressed");
  //         // },
  //         onChanged: (value) {
  //           debugPrint(value);
  //           setState(() {
  //             currentText = value;
  //           });
  //         },
  //         beforeTextPaste: (text) {
  //           debugPrint("Allowing to paste $text");
  //           //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
  //           //but you can show anything you want here, like your pop up saying wrong paste format or etc
  //           return true;
  //         },
  //       ),
  //     ),
  //   );
  // }

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
