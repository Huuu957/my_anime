import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_anime_list/constants.dart';
import 'package:my_anime_list/screens/anime_screens/more_anime_screen.dart';
import 'package:my_anime_list/screens/anime_screens/top_movie_list.dart';
import 'package:my_anime_list/screens/anime_screens/top_anime_list.dart';
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
              margin: EdgeInsets.only(top: 15.h),
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
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
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
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
            TopMovieList(size: size),
          ],
        ),
      ),
    );
  }
}
