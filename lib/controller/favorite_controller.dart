import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:my_anime_list/models/anime_model.dart';

import '../widgets/anime_card_widget/anime_card_widget.dart';

class FavoriteController extends GetxController {
  RxBool isFavorite = false.obs;
  RxList<AnimeModel> favList = <AnimeModel>[].obs;

  void toggleFavorite(AnimeModel anime) {
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

  void goToAnimeDetails(AnimeModel anime) {
    Get.to(() => AnimeCardWidget(anime: anime));
  }
}
