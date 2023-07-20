import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_anime/controller/theme_controller.dart';
import '../../constants.dart';

import '../../models/anime_model.dart';
import '../../screens/watch_trailer_screen.dart';

class PlayButtonWidget extends StatelessWidget {
  PlayButtonWidget({
    super.key,
    required this.anime,
  });

  final AnimeModel anime;
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    final gradientColors = themeController.isDarkMode.value
        ? [kDarkTeal, kDarkTeal1]
        : [
            kColorLightPurple,
            kColorMiddlePurple,
            kColorLightPink,
            kColorLighterPink,
          ];
    return Positioned(
      top: 85.h,
      left: 140.w,
      child: GestureDetector(
        onTap: () {
          Get.toNamed(WatchTrailerScreen.watchMoreScreen, arguments: anime);
        },
        child: Container(
          width: 80.w,
          height: 80.h,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: gradientColors,
            ),
          ),
          child: Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 45.w,
          ),
        ),
      ),
    );
  }
}
