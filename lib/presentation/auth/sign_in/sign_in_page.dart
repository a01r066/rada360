import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rada360/common/values/my_colors.dart';
import 'package:rada360/config/routes.dart';
import 'package:rada360/config/services_locator.dart';
import 'package:rada360/model/common/app_state_status.dart';
import 'package:rada360/presentation/auth/sign_in/sign_in_cubit.dart';
import 'package:rada360/presentation/auth/widgets/pin_code_widget.dart';
import 'package:rada360/presentation/common/k_elevated_button.dart';
import 'package:rada360/presentation/common/k_text.dart';
import 'package:rada360/presentation/common/k_text_style.dart';
import 'package:rada360/services/remote/network/endpoints.dart';
import 'package:tuple/tuple.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({
    super.key,
    required this.phone,
  });

  final String phone;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  SignInCubit signInCubit = SignInCubit(
      apiRepositories: locator.get(), prefRepository: locator.get());

  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => signInCubit,
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state.status == AppStateStatus.success) {
            final response = state.signInDataResponse;
            final token = response?.data?['token'];
            signInCubit.setSignInToken(token);
            Navigator.of(context).pushNamed(RoutePaths.surveyPage);
          }

          if (state.status == AppStateStatus.done) {
            Navigator.of(context).pushNamed(RoutePaths.otpPage,
                arguments: Tuple2(widget.phone, RoutePaths.signInPage));
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
    final hasMatched = signInCubit.state.hasMatched ?? false;
    final errorMessage = signInCubit.state.errorMessage ?? "";

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            KText(
              text: "Chào mừng bạn trở lại",
              textStyle: KTextStyle.titleTextStyle(),
              textAlign: TextAlign.center,
            ),
            KText(
              text:
                  "Vui lòng nhập mật khẩu để đăng nhập vào SĐT ${widget.phone}",
              textStyle: KTextStyle.descTextStyle(),
              textAlign: TextAlign.center,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            PinCodeWidget(
              length: 6,
              obscureText: true,
              onChangedCallback: (value) {},
              onCompletedCallback: (value) {
                final data = {'phone_number': widget.phone, 'password': value};
                signInCubit.signIn(endpoint: Endpoints.signIn, data: data);
              },
            ),
            errorMessage.isNotEmpty
                ? KText(
                    text: errorMessage + _wrongPasswordMsg(),
                    textStyle: KTextStyle.captionTextStyle(
                        textColor: const Color(0xFFE64646)),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  )
                : const SizedBox.shrink(),
            KElevatedButton(
              text: "Quên mật khẩu?",
              backgroundColor: hasMatched
                  ? MyColors.buttonColor
                  : MyColors.optionsColor.withOpacity(.2),
              onPressed: () {
                final data = {'phone': widget.phone};
                signInCubit.createOtp(
                    endpoint: Endpoints.createOtp, data: data);
              },
            )
          ],
        ),
      ),
    );
  }

  _wrongPasswordMsg() {
    final counter = signInCubit.state.counter ?? 0;
    String? msg = "";
    if (counter > 0) {
      msg = ". Bạn còn ${5 - counter} lần thử lại";
    }
    return msg;
  }
}
