import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants.dart';
import '../../screens/more_media_screen/more_anime_screen.dart';
import '../../screens/more_media_screen/more_movie_screen.dart';
import '../../screens/anime_screens/top_movie_list.dart';
import '../../screens/anime_screens/top_anime_list.dart';
import 'package:get/get.dart';

class AnimeScreen extends StatelessWidget {
  const AnimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPaleLavender,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: kDefaultPadding + 5),
              height: 50.h,
              padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: kDefaultPadding,
              ),
              child: Row(
                children: [
                  Text(
                    'Top Animes',
                    style: TextStyle(
                      fontSize: 17.5.sp,
                      color: kSecondaryColor,
                      fontFamily: kDefaultFont,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(MoreAnimeScreen.moreAnimeScreenRoute);
                    },
                    child: const Text(
                      'MORE',
                      style: TextStyle(
                        fontFamily: kDefaultFont,
                        color: kGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: kDefaultPadding),
            TopAnimeList(size: size),
            Container(
              height: 50.h,
              padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: kDefaultPadding,
              ),
              child: Row(
                children: [
                  Text(
                    'Top Movies',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: 17.5.sp,
                      fontFamily: kDefaultFont,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(MoreMovieScreen.moreMovieScreen);
                    },
                    child: const Text(
                      'MORE',
                      style: TextStyle(
                        fontFamily: kDefaultFont,
                        color: kGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: kDefaultPadding),
            TopMovieList(size: size),
          ],
        ),
      ),
    );
  }
}
