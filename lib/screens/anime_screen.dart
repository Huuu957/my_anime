import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_anime/controller/theme_controller.dart';
import '../constants.dart';
import 'more_media_screen/more_anime_screen.dart';
import 'more_media_screen/more_movie_screen.dart';
import '../api/dio_services.dart';
import '../widgets/anime_list_widget.dart';
import 'package:get/get.dart';

class AnimeScreen extends StatelessWidget {
  AnimeScreen({Key? key}) : super(key: key);

  final APIService apiService = APIService();

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
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
              AnimeListWidget(
                apiMethod: () => apiService.fetchTopAnime(kTopAnimeEndpoint),
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
              AnimeListWidget(
                apiMethod: () => apiService.fetchTopAnime(kTopMovieEndpoint),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
