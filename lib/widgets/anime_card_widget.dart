import 'package:flutter/material.dart';
import 'package:my_anime_list/constants.dart';
import 'package:my_anime_list/models/anime_model.dart';
import 'package:my_anime_list/screens/anime_screens/favorite_button.dart';
import 'package:get/get.dart';
import 'package:my_anime_list/screens/watch_trailer_screen.dart';

class AnimeCardWidget extends StatelessWidget {
  final TopAnimeModel anime;

  const AnimeCardWidget({
    Key? key,
    required this.anime,
  }) : super(key: key);

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
          style: const TextStyle(
            color: kSecondaryColor,
            fontFamily: kDefaultFont,
          ),
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
                              SizedBox(
                                width: 200,
                                child: Text(
                                  anime.title,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: kBigText,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: kDefaultFont,
                                  ),
                                ),
                              ),
                              const SizedBox(height: kDefaultPadding),
                              Row(
                                children: [
                                  Text(
                                    '${anime.episodes} Episodes -',
                                    style: const TextStyle(
                                      fontSize: kDefaultPadding,
                                      fontFamily: kDefaultFont,
                                    ),
                                  ),
                                  const SizedBox(width: kDefaultPadding - 7),
                                  Text(
                                    'Duration: ${anime.duration}',
                                    style: const TextStyle(
                                      fontSize: kDefaultPadding,
                                      fontFamily: kDefaultFont,
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
                                  fontFamily: kDefaultFont,
                                ),
                              ),
                              const SizedBox(height: kDefaultPadding / 2),
                              Container(
                                height: 25,
                                width: 37,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      kPinkishPurple,
                                      kBluishPurple,
                                    ],
                                  ),
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
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: kDefaultPadding,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: kDefaultFont,
                                    ),
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
                          Tab(text: 'More info'),
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
                            topLeft: Radius.circular(kBorderRadius),
                            topRight: Radius.circular(kBorderRadius),
                          ),
                        ),
                        child: TabBarView(
                          children: [
                            SingleChildScrollView(
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: kDefaultPadding,
                                    horizontal: kDefaultPadding),
                                child: Text(
                                  anime.description,
                                  style: const TextStyle(
                                    fontFamily: kDefaultFont,
                                  ),
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: kDefaultPadding,
                                  horizontal: kDefaultPadding,
                                ),
                                padding: const EdgeInsets.all(kDefaultPadding),
                                decoration: BoxDecoration(
                                  color:
                                      kPrimaryColor, // Set the desired shade of purple
                                  borderRadius: BorderRadius.circular(
                                      10), // Optionally, add rounded corners
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    buildRow('Rank', anime.rank, 180),
                                    buildRow('Scored by', anime.scoredBy, 160),
                                    buildRow(
                                        'Popularity', anime.popularity, 150),
                                    buildRow('Favorites', anime.favorites, 160),
                                    buildRow('Year', anime.year, 170),
                                    buildRow('Season', anime.season, 160),
                                  ],
                                ),
                              ),
                            ),
                            const Center(
                              child: Text(
                                  'Watching anime without paying is illegal :)'),
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
          Positioned(
            top: 110,
            left: 160,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(WatchTrailerScreen.watchMoreScreen,
                    arguments: anime);
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      kColorLightPurple,
                      kColorMiddlePurple,
                      kColorLightPink,
                      kColorLighterPink,
                    ],
                  ),
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 45,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildRow(String label, String value, double spacing) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: kDefaultFont,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: spacing),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: kDefaultFont,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      const SizedBox(height: kDefaultPadding),
    ],
  );
}
