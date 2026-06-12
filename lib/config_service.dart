import 'package:flutter/material.dart';

class ConfigService {
  final ValueNotifier<ThemeData> themeNotifier = ValueNotifier(_blueTheme());
  final ValueNotifier<String> currentThemeName = ValueNotifier("blue");

  static ThemeData _blueTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,

      scaffoldBackgroundColor: Colors.white,

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
      ),

      cardTheme: CardThemeData(
        color: Colors.blue,
      ),
    );
  }

  static ThemeData _blackTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,

      scaffoldBackgroundColor: Colors.black,

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue.shade900,
      ),

      cardTheme: CardThemeData(
        color: Colors.blue.shade900,
      ),
    );
  }

  void setBlackTheme() {
    themeNotifier.value = _blackTheme();

    currentThemeName.value = "black";
  }

  void setBlueTheme() {
    themeNotifier.value = _blueTheme();

    currentThemeName.value = "blue";
  }
}

final configService = ConfigService();
