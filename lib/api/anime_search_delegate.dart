import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../api/dio_services.dart';
import '../widgets/anime_card_widget/anime_card_widget.dart';

import '../constants.dart';
import '../models/anime_model.dart';

class AnimeSearchDelegate extends SearchDelegate {
  final animeSearchService = APIService();
  final searchMode = 'substring';

  @override
  List<Widget> buildActions(BuildContext context) {
    if (query.isEmpty) {
      return [];
    } else {
      return [
        IconButton(
          icon: const Icon(
            Icons.clear,
            color: kSecondaryColor,
          ),
          onPressed: () {
            query = '';
          },
        ),
      ];
    }
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: kSecondaryColor,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container(
        color: kPaleLavender,
        child: const Center(
          child: Text('Enter an Anime name to search'),
        ),
      );
    } else {
      return Container(
        color: kPaleLavender,
        child: FutureBuilder<List<dynamic>>(
          future: animeSearchService.searchAnime(
            query: query,
            searchMode: searchMode,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('An error occurred'),
              );
            } else {
              final searchResults = snapshot.data ?? [];
              if (searchResults.isEmpty) {
                return const Center(
                  child: Text('No results found'),
                );
              }

              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2 / 3,
                ),
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  final anime = AnimeModel.fromJson(searchResults[index]);
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => AnimeCardWidget(anime: anime));
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
                              child: Image.network(
                                anime.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Text(
                            anime.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontFamily: kDefaultFont,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      );
    }
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: kPaleLavender,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ),
    );
  }
}
