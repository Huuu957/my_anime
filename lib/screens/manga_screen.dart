import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_anime_list/constants.dart';

import '../api/dio_services.dart';
import '../models/anime_model.dart';
import '../widgets/anime_card_widget/anime_card_widget.dart';

class MangaScreen extends StatelessWidget {
  const MangaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPaleLavender,
      body: FutureBuilder<List<AnimeModel>>(
        future: APIService().fetchTopAnime(kTopAnimeEndpoint),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            final animes = snapshot.data!;
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 250,
              ),
              itemCount: animes.length,
              itemBuilder: (context, index) {
                final anime = animes[index];
                return Container(
                  margin: EdgeInsets.symmetric(
                    vertical: kDefaultPadding,
                    horizontal: kDefaultPadding - 5,
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                  () => AnimeCardWidget(anime: animes[index]));
                            },
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
                              child: Image.network(
                                anime.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 150,
                            left: 5,
                            child: Container(
                              color: kPrimaryColor,
                              child: Text(
                                'Eps: ${anime.episodes}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: kDefaultPadding,
                                  fontFamily: kDefaultFont,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        animes[index].title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: kBigText,
                          fontFamily: kDefaultFont,
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            'Score: ',
                            style: TextStyle(
                              color: kSecondaryColor,
                              fontSize: 12,
                              fontFamily: kDefaultFont,
                            ),
                          ),
                          Container(
                            height: 17,
                            width: 40,
                            decoration: const BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.elliptical(100, 100),
                                right: Radius.elliptical(100, 100),
                              ),
                            ),
                            padding: EdgeInsets.zero, // Remove all padding
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '${animes[index].score}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: kDefaultPadding,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: kDefaultFont,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Failed to fetch anime data'),
            );
          }
          return const Center(
            child: Text('No data available'),
          );
        },
      ),
    );
  }
}
