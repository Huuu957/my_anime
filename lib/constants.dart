import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_anime/themes/my_app_theme.dart';

import 'controller/theme_controller.dart';

// Light Mode Colors--------------------------------
const kPrimaryColor = Color(0xFF9457EB);
const kSecondaryColor = Colors.black;

const kGrey = Colors.grey;
const kVeryLightPurple = Color(0xFFF7F5F9);
const kPaleLavender = Color(0xFFF0EEFF);
const kPinkishPurple = Color(0xFFB666D2);
const kBluishPurple = Color(0xFF8B56DC);
const kColorLightPurple = Color(0xFFA07CF0);
const kColorMiddlePurple = Color(0xFFB16FEF);
const kColorLightPink = Color(0xFFC163EF);
const kColorLighterPink = Color(0xFFC85EEF);
const kShadeColor = Color(0xFFEEF0FF);
const kComplementPrimary = Color(0xFFF48BFF);

// Dark Mode Colors--------------------------------
const kDarkColor = Colors.black;
const kLightColor = Colors.white;
const kDarkTeal = Color(0xFF163E59);
const kDarkTeal1 = Color(0xFF226F92);
const kDarkTeal2 = Color(0xFFF9BE02);

const kDarkPurple = Color(0xFF533D71);
const kDarkLavender = Color(0xFF42356C);
const kDarkGrey = Color(0x33000000);

const kTextDark = Colors.white;
const kTextLight = Colors.black;

// Fonts-------------------------------------------
const kDefaultFont = 'Roboto';

// Dimensions--------------------------------------
double kDefaultPadding = 10.w;
double kBorderRadius = 13.0;
double kButtonRadius = 50.0.sp;
double kBigText = 15.0.sp;
double kSmallText = 10.0.sp;

// Text Styles-------------------------------------
TextStyle kBoldText(ThemeController themeController, double fontSize) {
  return TextStyle(
    color: themeController.isDarkMode.value
        ? MyAppTheme.customDarkTheme.textTheme.displayLarge?.color
        : MyAppTheme.customLightTheme.textTheme.displayLarge?.color,
    fontFamily: kDefaultFont,
    fontSize: fontSize.sp,
    fontWeight: FontWeight.bold,
  );
}

TextStyle kLightText(ThemeController themeController, double fontSize) {
  return TextStyle(
    color: themeController.isDarkMode.value
        ? MyAppTheme.customDarkTheme.textTheme.displayLarge?.color
        : MyAppTheme.customLightTheme.textTheme.displayLarge?.color,
    fontFamily: kDefaultFont,
    fontSize: fontSize.sp,
  );
}

// API Endpoints----------------------------------
const String kTopAnimeEndpoint = 'https://api.jikan.moe/v4/top/anime';
const String kTopMovieEndpoint =
    'https://api.jikan.moe/v4/top/anime?type=movie';
const String kTopMangaEndpoint = 'https://api.jikan.moe/v4/top/manga';
const String kSearchEndpoint = 'https://api.jikan.moe/v4/anime';
