import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigService {
  static const String themeKey = "select_theme";
  final ValueNotifier<ThemeData> themeNotifier = ValueNotifier(_lightTheme());
  final ValueNotifier<String> currentThemeName = ValueNotifier("light");

  Future<void> saveTheme(String themeName) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(themeKey, themeName);
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();

    final savedTheme = prefs.getString(themeKey);

    if (savedTheme != null) {
      themeNotifier.value = _getTheme(savedTheme);
      currentThemeName.value = savedTheme;
    }
  }

  ThemeData _getTheme(String themeName) {
    if (themeName == "black") {
      return _blackTheme();
    } else {
      return _lightTheme();
    }
  }

  Future<void> applyTheme(String themeName) async {
    themeNotifier.value = _getTheme(themeName);

    currentThemeName.value = themeName;

    await saveTheme(themeName);
  }

  static ThemeData _lightTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,

      scaffoldBackgroundColor: Colors.white,

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      cardTheme: CardThemeData(color: Colors.blue),

      textTheme: const TextTheme(
        headlineSmall: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),

        bodyLarge: TextStyle(color: Colors.black),

        bodyMedium: TextStyle(color: Colors.black),

        bodySmall: TextStyle(color: Colors.black),

        titleMedium: TextStyle(color: Colors.white)
      ),
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

      textTheme: const TextTheme(
        headlineSmall: TextStyle(
          color: Colors.deepPurple,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),

        bodyLarge: TextStyle(color: Colors.purple),

        bodyMedium: TextStyle(color: Colors.purple),

        bodySmall: TextStyle(color: Colors.purple),

        titleMedium: TextStyle(color: Colors.white),

        titleSmall: TextStyle(color: Colors.white),
      ),
    );
  }

  Future<void> setBlackTheme() async {
    await applyTheme("black");
  }

  Future<void> setLightTheme() async {
    await applyTheme("light");
  }
}

final configService = ConfigService();
