import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Colors-----------------------------------------
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

// Fonts-------------------------------------------
const kDefaultFont = 'Roboto';

// Dimensions--------------------------------------
double kDefaultPadding = 10.w;
double kBorderRadius = 13.0.sp;
double kButtonRadius = 50.0.sp;
double kIndicatorWidth = 60.0.w;

// Text Styles-------------------------------------
double kBigText = 15.0.sp;
double kSmallText = 10.0.sp;

TextStyle myTextStyle(double fontSize) {
  return TextStyle(
    fontSize: fontSize.sp,
    color: kSecondaryColor,
    fontFamily: kDefaultFont,
    fontWeight: FontWeight.bold,
  );
}

// API Endpoints----------------------------------
const String kTopAnimeEndpoint = 'https://api.jikan.moe/v4/top/anime';
const String kTopMovieEndpoint =
    'https://api.jikan.moe/v4/top/anime?type=movie';
const String kMangas = 'https://api.jikan.moe/v4/top/manga';
