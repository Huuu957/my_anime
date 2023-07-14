import 'package:flutter/material.dart';
import 'package:my_anime_list/constants.dart';

class MyAppTheme {
  static ThemeData customLightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: kPaleLavender,
    ),
  );
  static ThemeData customDarkTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
    ),
  );
}
