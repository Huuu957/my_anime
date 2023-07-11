import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_anime_list/constants.dart';
import 'package:my_anime_list/controller/favorite_controller.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoriteController favoriteController = Get.find();

    return Scaffold(
      backgroundColor: kPaleLavender,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: kPaleLavender,
        title: const Text(
          'Favorites',
          style: TextStyle(color: kSecondaryColor),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.black,
            height: 1.0,
          ),
        ),
      ),
      body: Obx(() {
        final favorites = favoriteController.favList;
        if (favorites.isEmpty) {
          return const Center(
            child: Text('Your Favorites Collection is Empty'),
          );
        } else {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
            ),
            itemCount: favorites.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                favoriteController.goToAnimeDetails(favorites[index]);
              },
              child: Padding(
                padding: EdgeInsets.all(kDefaultPadding),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                        child: Image.network(favorites[index].image),
                      ),
                    ),
                    SizedBox(height: kDefaultPadding),
                    Text(
                      favorites[index].title,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: myTextStyle(kSmallText + 2),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}
