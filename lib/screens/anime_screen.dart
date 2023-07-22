import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../constants.dart';
import '../controller/anime_list_controller.dart';
import '../controller/theme_controller.dart';
import '../widgets/anime_list_widget.dart';
import 'more_media_screen/more_anime_screen.dart';
import 'more_media_screen/more_movie_screen.dart';

class AnimeScreen extends StatelessWidget {
  AnimeScreen({Key? key}) : super(key: key);
  final ThemeController themeController = Get.find();
  final AnimeListController animeListController =
      Get.put(AnimeListController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor:
            themeController.isDarkMode.value ? kDarkColor : kPaleLavender,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50.h,
                margin: EdgeInsets.only(top: kDefaultPadding + 5),
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: kDefaultPadding,
                ),
                child: Row(
                  children: [
                    Text(
                      'Top Animes',
                      style: kLightLargeThemeText(themeController, kBigText),
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
              Obx(
                () {
                  if (animeListController.animeList.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(kPrimaryColor),
                      ),
                    );
                  } else {
                    return AnimeListWidget(
                      animes: animeListController.animeList.toList(),
                    );
                  }
                },
              ),
              Container(
                height: 50.h,
                margin: EdgeInsets.only(top: kDefaultPadding + 5),
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: kDefaultPadding,
                ),
                child: Row(
                  children: [
                    Text(
                      'Top Movies',
                      style: kLightLargeThemeText(themeController, kBigText),
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
              Obx(
                () {
                  if (animeListController.movieList.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(kPrimaryColor),
                      ),
                    );
                  } else {
                    return AnimeListWidget(
                      animes: animeListController.movieList.toList(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
