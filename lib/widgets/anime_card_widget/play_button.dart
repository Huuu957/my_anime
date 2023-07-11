import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_anime_list/constants.dart';

import '../../models/anime_model.dart';
import '../../screens/watch_trailer_screen.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
    required this.anime,
  });

  final AnimeModel anime;

  @override
  Widget build(BuildContext context) {
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
          decoration: const BoxDecoration(
            color: kPrimaryColor,
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                kColorLightPurple,
                kColorMiddlePurple,
                kColorLightPink,
                kColorLighterPink,
              ],
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
