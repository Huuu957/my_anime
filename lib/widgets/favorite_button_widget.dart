import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants.dart';
import '../controller/favorite_controller.dart';
import '../models/anime_model.dart';

class FavoriteButtonWidget extends StatelessWidget {
  const FavoriteButtonWidget({Key? key, required this.anime}) : super(key: key);
  final AnimeModel anime;

  @override
  Widget build(BuildContext context) {
    final FavoriteController favoriteController = Get.find();

    return Obx(() {
      final isFavorite = favoriteController.favList.contains(anime);
      return ElevatedButton(
        onPressed: () {
          favoriteController.toggleFavorite(anime);
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: isFavorite ? kPrimaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kButtonRadius),
            side: BorderSide(
              color: isFavorite ? Colors.white : kPrimaryColor,
            ),
          ),
        ),
        child: Text(
          isFavorite ? 'Got Added' : 'Add To My Favorites',
          style: TextStyle(
            color: isFavorite ? Colors.white : kPrimaryColor,
          ),
        ),
      );
    });
  }
}
