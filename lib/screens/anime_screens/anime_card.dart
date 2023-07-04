import 'package:flutter/material.dart';
import 'package:my_anime_list/models/anime_model.dart';
import 'package:my_anime_list/constants.dart';
import 'package:my_anime_list/screens/anime_screens/favorite_button.dart';

class AnimeCard extends StatelessWidget {
  final AnimeModel anime;

  AnimeCard({
    super.key,
    required this.anime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: kLightPurple,
        iconTheme: const IconThemeData(color: kSecondaryColor),
        title: Text(
          anime.title,
          style: const TextStyle(color: kSecondaryColor),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  kLightPurple,
                  kPaleLavender,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            bottom: kDefaultPadding * 5.5,
            left: 0,
            right: 0,
            child: Container(
              height: 500,
              padding: const EdgeInsets.only(top: 160),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(kBorderRadius),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 4),
                    blurRadius: 6,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: DefaultTabController(
                length: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding * 2),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 75,
                            width: 75,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
                              child: Image.network(
                                anime.image,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text(anime.title),
                              const SizedBox(height: kDefaultPadding),
                              Row(
                                children: [
                                  Text(
                                    '${anime.episodes} Episodes',
                                    style: const TextStyle(
                                      fontSize: kDefaultPadding,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: kDefaultPadding * 2),
                                  Text(
                                    'Duration: ${anime.duration} mins',
                                    style: const TextStyle(
                                      fontSize: kDefaultPadding,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                'Score',
                                style: TextStyle(
                                  fontSize: kDefaultPadding,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: kDefaultPadding / 2),
                              Container(
                                height: 30,
                                decoration: const BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.horizontal(
                                    left: Radius.elliptical(100, 100),
                                    right: Radius.elliptical(100, 100),
                                  ),
                                ),
                                padding: const EdgeInsets.all(kDefaultPadding),
                                child: Text(
                                  '${anime.score}',
                                  style: const TextStyle(
                                    fontSize: kDefaultPadding,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const TabBar(
                        tabs: [
                          Tab(text: 'Overview'),
                          Tab(text: 'Review'),
                          Tab(text: 'Episodes'),
                        ],
                        labelColor: kSecondaryColor,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: kPrimaryColor,
                      ),
                      Container(
                        height: 150,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        child: TabBarView(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Text(anime.description),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Text(anime.description),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Text(anime.description),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: FavoriteButton(anime: anime),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 75),
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorderRadius),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 4),
                  blurRadius: 6,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kBorderRadius),
              child: Image.network(
                anime.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
