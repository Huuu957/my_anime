import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../models/anime_model.dart';
import '../widgets/anime_card_widget/anime_card_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteController extends GetxController {
  RxBool isFavorite = false.obs;
  RxList<AnimeModel> favList = <AnimeModel>[].obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  void toggleFavorite(AnimeModel anime) {
    if (favList.contains(anime)) {
      favList.remove(anime);
      if (kDebugMode) {
        print('Anime Removed');
      }
    } else {
      favList.add(anime);
      if (kDebugMode) {
        print('Anime Added');
      }
    }

    _updateFavoriteListInFirestore();
  }

  Future<void> _updateFavoriteListInFirestore() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final userId = user.uid;
        await _usersCollection.doc(userId).set({
          'favorites': favList.map((anime) => anime.toJson()).toList(),
        });

        await loadFavoriteListFromFirestore();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error updating favorite list in Firestore: $e');
      }
    }
  }

  void goToAnimeDetails(AnimeModel anime) {
    Get.to(() => AnimeCardWidget(anime: anime));
  }

  @override
  void onInit() {
    super.onInit();
    loadFavoriteListFromFirestore();
  }

  Future<void> loadFavoriteListFromFirestore() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final userId = user.uid;
        final docSnapshot = await _usersCollection.doc(userId).get();
        if (docSnapshot.exists) {
          final data = docSnapshot.data() as Map<String, dynamic>?;

          if (data != null) {
            final favoriteList = data['favorites'] as List<dynamic>?;

            if (favoriteList != null) {
              favList.value = favoriteList
                  .map((item) =>
                      AnimeModel.fromJson(item as Map<String, dynamic>))
                  .toList();
            }
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading favorite list from Firestore: $e');
      }
    }
  }
}
