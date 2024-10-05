import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefRepositoryKeys {
  static const String theme = 'theme';
  static const String locale = 'locale';
  static const String showOnboarding = "showOnboarding";
}

class PrefRepository {
  const PrefRepository({
    required this.preferences,
  });

  final SharedPreferences preferences;

  // Locale
  Locale? getAppLanguage() {
    var langCode = preferences.getString(PrefRepositoryKeys.locale);
    if (langCode == null) {
      return const Locale('en', 'US'); // en | vi
    }
    return Locale(langCode);
  }

  Future<bool> setAppLanguage(Locale locale) async {
    return preferences.setString(
        PrefRepositoryKeys.locale, locale.languageCode);
  }

  // Onboarding
  needOnboarding() {
    return preferences.getBool(PrefRepositoryKeys.showOnboarding) ?? true;
  }

  finishOnboarding() async {
    return preferences.setBool(PrefRepositoryKeys.showOnboarding, false);
  }
}