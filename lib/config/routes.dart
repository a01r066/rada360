import 'package:flutter/material.dart';
import 'package:rada360/presentation/auth/otp/otp_page.dart';
import 'package:rada360/presentation/auth/sign_in/sign_in_page.dart';
import 'package:rada360/presentation/home_controller/home_controller_page.dart';
import 'package:rada360/presentation/onboard/onboarding_page.dart';

class RoutePaths {
  static const String onBoardingPage = "/onBoardingPage";
  static const String homeControllerPage = "/homeControllerPage";

  // Register, login
  static const String signInPage = "/signInPage";
  static const String otpPage = "/otpPage";
}

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.onBoardingPage:
        return _materialRoute(const OnboardingPage(), settings);
      case RoutePaths.homeControllerPage:
        return _materialRoute(const HomeControllerPage(), settings);
      case RoutePaths.signInPage:
        return _materialRoute(const SignInPage(), settings);
      case RoutePaths.otpPage:
        return _materialRoute(const OtpPage(), settings);
      default:
        return _materialRoute(const HomeControllerPage(), settings);
    }
  }

  static Route<dynamic> _materialRoute(Widget view, RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => view, settings: settings);
  }
}
