import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_anime/controller/theme_controller.dart';
import '../constants.dart';
import '../controller/favorite_controller.dart';
import '../models/anime_model.dart';

class FavoriteButtonWidget extends StatelessWidget {
  FavoriteButtonWidget({Key? key, required this.anime}) : super(key: key);
  final AnimeModel anime;
  final FavoriteController favoriteController = Get.find();
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isFavorite = favoriteController.favList.contains(anime);
      return ElevatedButton(
        onPressed: () {
          favoriteController.toggleFavorite(anime);
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: isFavorite
              ? themeController.isDarkMode.value
                  ? kDarkTeal
                  : kPrimaryColor
              : kLightColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kButtonRadius),
            side: BorderSide(
              color: isFavorite
                  ? themeController.isDarkMode.value
                      ? kDarkTeal
                      : kLightColor
                  : themeController.isDarkMode.value
                      ? kDarkTeal
                      : kPrimaryColor,
            ),
          ),
        ),
        child: Text(
          isFavorite ? '24'.tr : '23'.tr,
          style: TextStyle(
            color: isFavorite
                ? kLightColor
                : themeController.isDarkMode.value
                    ? kDarkTeal1
                    : kPrimaryColor,
          ),
        ),
      );
    });
  }
}
