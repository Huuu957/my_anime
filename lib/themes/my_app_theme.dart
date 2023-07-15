import 'package:flutter/material.dart';
import '../constants.dart';

class MyAppTheme {
  static ThemeData customLightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: kPaleLavender,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Colors.black,
      ),
    ),
  );

  static ThemeData customDarkTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}
