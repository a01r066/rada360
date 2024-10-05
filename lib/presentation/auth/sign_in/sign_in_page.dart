import 'package:flutter/material.dart';
import 'package:rada360/common/values/dimens.dart';
import 'package:rada360/config/routes.dart';
import 'package:rada360/gen/assets.gen.dart';
import 'package:rada360/presentation/common/k_elevated_button.dart';
import 'package:rada360/presentation/common/k_text.dart';
import 'package:rada360/presentation/common/k_text_style.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {},
              child: const KText(
                text: "Để sau",
                textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFB8B8B8),
                ),
              )),
        ],
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        children: [
          KText(
            text: "Đăng ký/Đăng nhập",
            textStyle: KTextStyle.titleTextStyle,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimens.vertical),
            child: KText(
              text:
                  "Chào bạn, vui lòng nhập số điện thoại để đăng ký/đăng nhập",
              textStyle: KTextStyle.descriptionTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimens.vertical),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  KText(
                    text: "Số điện thoại",
                    textStyle: KTextStyle.customTextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400, height: 2.0),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xFFE8E8E8))),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xFFE8E8E8))),
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xFFE8E8E8))),
                      hintText: 'Nhập số điện thoại',
                      prefixIcon: Image.asset(Assets.icons.icMobile.path),
                      labelStyle: KTextStyle.descriptionTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          KElevatedButton(
            text: "Tiếp Tục",
            onPressed: () {
              Navigator.of(context).pushNamed(RoutePaths.otpPage);
            },
          ),
          const KText(
            text:
                "Bằng việc tiếp tục, bạn đã đồng ý với Quy chế sử dụng dịch vụ của chúng tôi",
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
