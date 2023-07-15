import 'package:flutter/material.dart';
import '../constants.dart';

class MyAppTheme {
  static ThemeData customLightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: kPaleLavender,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: kSecondaryColor,
      ),
    ),
  );
  static ThemeData customDarkTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: kPaleLavenderDark,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: kSecondaryColorDark,
      ),
    ),
  );
}
