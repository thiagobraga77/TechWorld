import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigService {
  static const String themeKey = "select_theme";
  static const String lightTheme = "light";
  static const String blackTheme = "black";
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
    final Map<String, ThemeData Function()> themes = {
      lightTheme: _lightTheme,
      blackTheme: _blackTheme,
    };

    return themes[themeName] != null ? themes[themeName]!() : _lightTheme();

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

      drawerTheme: DrawerThemeData(backgroundColor: Colors.white),

      iconTheme: IconThemeData(color: Colors.blue),

      listTileTheme: ListTileThemeData(
        textColor: Colors.black,
        iconColor: Colors.blue,
      ),


      textTheme: const TextTheme(
        headlineSmall: TextStyle(color: Colors.black, fontSize: 20),

        bodyLarge: TextStyle(color: Colors.black),

        bodyMedium: TextStyle(color: Colors.black),

        bodySmall: TextStyle(color: Colors.black),

        titleLarge: TextStyle(color: Colors.white, fontSize: 24),

        titleMedium: TextStyle(color: Colors.white),

        titleSmall: TextStyle(color: Colors.white),
      ),
    );
  }

  static ThemeData _blackTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,

      scaffoldBackgroundColor: Colors.black,

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade900,
        foregroundColor: Colors.grey,
      ),

      cardTheme: CardThemeData(color: Colors.grey.shade900),

      drawerTheme: DrawerThemeData(backgroundColor: Colors.black),

      iconTheme: IconThemeData(color: Colors.white),

      listTileTheme: ListTileThemeData(
        textColor: Colors.grey,
        iconColor: Colors.grey,
      ),

      textTheme: const TextTheme(
        headlineSmall: TextStyle(color: Colors.grey, fontSize: 20),

        bodyLarge: TextStyle(color: Colors.white),

        bodyMedium: TextStyle(color: Colors.white),

        bodySmall: TextStyle(color: Colors.white),

        titleLarge: TextStyle(color: Colors.white, fontSize: 24),

        titleMedium: TextStyle(color: Colors.white),

        titleSmall: TextStyle(color: Colors.white),
      ),
    );
  }

  Future<void> setBlackTheme() async {
    await applyTheme(blackTheme);
  }

  Future<void> setLightTheme() async {
    await applyTheme(lightTheme);
  }
}

final configService = ConfigService();
