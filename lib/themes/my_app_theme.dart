import 'package:flutter/material.dart';
import '../constants.dart';

class MyAppTheme {
  static ThemeData customLightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: kPaleLavender,
    ),
    canvasColor: kPaleLavender,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: kTextLight,
      ),
      displayMedium: TextStyle(
        color: kTextDark,
      ),
      displaySmall: TextStyle(
        color: kTextLight,
      ),
    ),
  );

  static ThemeData customDarkTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: kDarkColor,
    ),
    canvasColor: kDarkColor,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: kTextDark,
      ),
      displayMedium: TextStyle(
        color: kTextDark,
      ),
      displaySmall: TextStyle(
        color: kTextDark,
      ),
    ),
  );
}
