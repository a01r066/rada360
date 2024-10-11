import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rada360/common/utils/my_logger.dart';
import 'package:rada360/common/values/my_colors.dart';
import 'package:rada360/config/routes.dart';
import 'package:rada360/config/services_locator.dart';
import 'package:rada360/model/common/app_state_status.dart';
import 'package:rada360/presentation/auth/register_sign_in/register_sign_in_cubit.dart';
import 'package:rada360/presentation/auth/widgets/pin_code_widget.dart';
import 'package:rada360/presentation/common/k_elevated_button.dart';
import 'package:rada360/presentation/common/k_text.dart';
import 'package:rada360/presentation/common/k_text_style.dart';
import 'package:rada360/services/remote/network/endpoints.dart';

class RegisterSignInPage extends StatefulWidget {
  const RegisterSignInPage({super.key});

  @override
  State<RegisterSignInPage> createState() => _RegisterSignInPageState();
}

class _RegisterSignInPageState extends State<RegisterSignInPage> {
  RegisterSignInCubit registerSignInCubit =
      RegisterSignInCubit(apiRepositories: locator.get());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => registerSignInCubit,
      child: BlocConsumer<RegisterSignInCubit, RegisterSignInState>(
        listener: (context, state) {
          if (state.status == AppStateStatus.success) {
            final signupDataResponse = state.signupDataResponse;
            if (signupDataResponse?.success == true) {
              MyLogger.info("message: ${signupDataResponse?.data.toString()}");
              Navigator.of(context).pushNamed(RoutePaths.surveyPage);
            } else {
              MyLogger.info("message: ${signupDataResponse?.message}");
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

  _buildBody() {
    final hasMatched = registerSignInCubit.state.hasMatched ?? false;
    final errorMessage = registerSignInCubit.state.errorMessage ?? "";

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            KText(
              text: "Chào mừng bạn đến với Beauty 360",
              textStyle: KTextStyle.titleTextStyle(),
              textAlign: TextAlign.center,
            ),
            KText(
              text: "Vui lòng nhập mật khẩu để đăng ký",
              textStyle: KTextStyle.descTextStyle(),
              textAlign: TextAlign.center,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            _pinCodeInput(
                caption: "Nhập mật khẩu",
                onChangedCallback: (value) {
                  registerSignInCubit.updatePinCode(
                      pinCode: value, source: 'input');
                },
                onCompletedCallback: (value) {}),
            _pinCodeInput(
                caption: "Xác nhận mật khẩu",
                onChangedCallback: (value) {
                  registerSignInCubit.updatePinCode(
                      pinCode: value, source: 'confirm');
                },
                onCompletedCallback: (value) {}),
            errorMessage.isNotEmpty
                ? KText(
                    text: errorMessage,
                    textStyle: KTextStyle.captionTextStyle(
                        textColor: const Color(0xFFE64646)),
                    textAlign: TextAlign.center,
                  )
                : const SizedBox.shrink(),
            KElevatedButton(
              text: "Đăng ký",
              backgroundColor: hasMatched
                  ? MyColors.buttonColor
                  : MyColors.optionsColor.withOpacity(.2),
              onPressed: () {
                final password = registerSignInCubit.state.inputPinCode;
                FormData formData = FormData.fromMap({
                  'phone_number': '0902989196',
                  'password': password,
                  'password_confirmation': password,
                  'gender': 'Nam'
                });
                registerSignInCubit.signUp(
                    endpoint: Endpoints.signUp, formData: formData);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _pinCodeInput({
    required String caption,
    required Function(String)? onChangedCallback,
    required Function(String) onCompletedCallback,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          KText(
            text: caption,
            textStyle: KTextStyle.captionTextStyle(),
            padding: const EdgeInsets.only(bottom: 8),
          ),
          PinCodeWidget(
            length: 6,
            obscureText: true,
            onChangedCallback: (value) {
              onChangedCallback!(value);
            },
            onCompletedCallback: (value) {
              onCompletedCallback(value);
            },
          ),
        ],
      ),
    );
  }
}
