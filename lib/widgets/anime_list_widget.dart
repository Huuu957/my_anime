import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../constants.dart';
import '../controller/theme_controller.dart';
import '../models/anime_model.dart';
import 'anime_card_widget/anime_card_widget.dart';

class AnimeListWidget extends StatelessWidget {
  AnimeListWidget({
    Key? key,
    required this.animes,
  }) : super(key: key);

  final ThemeController themeController = Get.find();
  final List<AnimeModel> animes;

  @override
  Widget build(BuildContext context) {
    final int itemCount = animes.length < 6 ? animes.length : 6;

    return SizedBox(
      height: 250.h,
      width: 400.w,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          final AnimeModel anime = animes[index];
          return InkWell(
            onTap: () {
              Get.to(() => AnimeCardWidget(anime: anime));
            },
            child: Container(
              width: 150.w,
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(kBorderRadius),
                      child: Image.network(
                        anime.image,
                        width: double.infinity,
                        height: 130.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: kDefaultPadding),
                  Text(
                    anime.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kLightLargeThemeText(themeController, kBigText),
                  ),
                  SizedBox(height: kDefaultPadding / 2),
                  Row(
                    children: [
                      Text(
                        'Score: ',
                        style: kLightSmallThemeText(
                            themeController, kSmallText + 2),
                      ),
                      Container(
                        height: 17.h,
                        width: 40.w,
                        decoration: const BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.elliptical(100, 100),
                            right: Radius.elliptical(100, 100),
                          ),
                        ),
                        padding: EdgeInsets.zero, // Remove all padding
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '${anime.score}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: kDefaultFont,
                              fontWeight: FontWeight.bold,
                              fontSize: kSmallText,
                              color: kTextDark,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: kDefaultPadding / 2),
                  Row(
                    children: [
                      Text(
                        '${anime.episodes} Eps - ',
                        style: TextStyle(
                          color: themeController.isDarkMode.value
                              ? kTextDark
                              : kSecondaryColor.withOpacity(0.6),
                          fontSize: kSmallText + 2,
                          fontFamily: kDefaultFont,
                        ),
                      ),
                      Text(
                        anime.duration,
                        style: TextStyle(
                          color: themeController.isDarkMode.value
                              ? kTextDark
                              : kSecondaryColor.withOpacity(0.6),
                          fontSize: kSmallText + 2,
                          fontFamily: kDefaultFont,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
