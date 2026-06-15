import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageService {
  static const String languageKey = "salected_language";

  final ValueNotifier<String> currentLanguage = ValueNotifier("pt_BR");

  Future<void> saveLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(languageKey, language);
  }

  Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();

    final savedLanguage = prefs.getString(languageKey);

    if (savedLanguage != null) {
      currentLanguage.value = savedLanguage;

      if (savedLanguage == "en_US") {
        Get.updateLocale(const Locale('en', 'US'));
      } else {
        Get.updateLocale(const Locale('pt', 'BR'));
      }
    }
  }

  Future<void> applyLanguage(String language) async {
    currentLanguage.value = language;

    if (language == "en_US") {
      Get.updateLocale(const Locale('en', 'US'));
    } else {
      Get.updateLocale(const Locale('pt_BR', 'BR'));
    }
    await saveLanguage(language);
  }
}

final languageService = LanguageService();


