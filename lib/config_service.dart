import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigService {
  static const String themeKey = "select_theme";
  final ValueNotifier<ThemeData> themeNotifier = ValueNotifier(_lightTheme());
  final ValueNotifier<String> currentThemeName = ValueNotifier("blue");

  Future<void> saveTheme(String themeName) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(themeKey, themeName);
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();

    final savedTheme = prefs.getString(themeKey);

    if (savedTheme == "light") {

      themeNotifier.value = _lightTheme();
      currentThemeName.value = "light";

    } else if (savedTheme == "black") {

      themeNotifier.value = _blackTheme();
      currentThemeName.value = "black";
      
    }
  }

  static ThemeData _lightTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,

      scaffoldBackgroundColor: Colors.white,

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.black,
      ),

      cardTheme: CardThemeData(color: Colors.blue),
    );
  }

  static ThemeData _blackTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,

      scaffoldBackgroundColor: Colors.black,

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,
      ),

      cardTheme: CardThemeData(color: Colors.blue.shade900),
    );
  }

  Future<void> setBlackTheme() async {
    themeNotifier.value = _blackTheme();

    currentThemeName.value = "black";

    await saveTheme(currentThemeName.value);
  }

  Future<void> setLightTheme() async {
    themeNotifier.value = _lightTheme();

    currentThemeName.value = "light";

    await saveTheme(currentThemeName.value);
  }
}

final configService = ConfigService();
