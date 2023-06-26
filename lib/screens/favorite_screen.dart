import 'package:flutter/material.dart';

import '../models/anime_model.dart';
import 'anime_screens/anime_card.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  final List<Widget> favoritesCollection = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: favoritesCollection.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnimeCard(anime: animes[index]),
                ));
          },
        ),
      ),
    );
  }
}
