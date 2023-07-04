import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:my_anime_list/models/anime_model.dart';

class FavoriteController extends GetxController {
  RxBool isFavorite = false.obs;
  var favList = <AnimeModel>[].obs;

  toggleFavorite(AnimeModel anime) {
    if (favList.contains(anime)) {
      // Remove the anime from favorites
      favList.remove(anime);
      if (kDebugMode) {
        print('Anime Removed');
      }
    } else {
      // Add the anime to favorites
      favList.add(anime);
      if (kDebugMode) {
        print('Anime Added');
      }
    }
  }
}
