import 'package:flutter/material.dart';
import 'package:rada360/presentation/auth/otp/otp_page.dart';
import 'package:rada360/presentation/auth/phone_input//phone_input_page.dart';
import 'package:rada360/presentation/auth/register/register_page.dart';
import 'package:rada360/presentation/auth/sign_in/sign_in_page.dart';
import 'package:rada360/presentation/home_controller/home_controller_page.dart';
import 'package:rada360/presentation/onboard/onboarding_page.dart';
import 'package:rada360/presentation/survey/survey_page.dart';

class RoutePaths {
  static const String onBoardingPage = "/onBoardingPage";
  static const String surveyPage = "/surveyPage";
  static const String homeControllerPage = "/homeControllerPage";

  // Register, login
  static const String phoneInputPage = "/phoneInputPage";
  static const String otpPage = "/otpPage";
  static const String registerPage = "/registerPage";
  static const String signInPage = "/signInPage";
}

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.onBoardingPage:
        return _materialRoute(const OnboardingPage(), settings);
      case RoutePaths.surveyPage:
        return _materialRoute(const SurveyPage(), settings);
      case RoutePaths.homeControllerPage:
        return _materialRoute(const HomeControllerPage(), settings);
      case RoutePaths.phoneInputPage:
        return _materialRoute(const PhoneInputPage(), settings);
      case RoutePaths.otpPage:
        final phone = settings.arguments as String;
        return _materialRoute(OtpPage(phone: phone), settings);
      case RoutePaths.signInPage:
        final phone = settings.arguments as String;
        return _materialRoute(SignInPage(phone: phone), settings);
      case RoutePaths.registerPage:
        final phone = settings.arguments as String;
        return _materialRoute(RegisterPage(phone: phone), settings);
      default:
        return _materialRoute(const HomeControllerPage(), settings);
    }
  }

  static Route<dynamic> _materialRoute(Widget view, RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => view, settings: settings);
  }
}
