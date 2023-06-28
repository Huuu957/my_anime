import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_anime_list/constants.dart';

import '../models/anime_model.dart';
import 'anime_screens/anime_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key});

  static const favoriteScreenRoute = '/favoriteScreenRoute';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPaleLavender,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: kPaleLavender,
        title: const Text(
          'Favorties',
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
      body: const Center(
        child: Text('Your Favorites Collection is Empty'),
      ),
    );
  }
}
