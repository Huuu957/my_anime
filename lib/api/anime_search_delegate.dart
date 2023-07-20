import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/theme_controller.dart';
import '../api/dio_services.dart';
import '../widgets/anime_card_widget/anime_card_widget.dart';

import '../constants.dart';
import '../models/anime_model.dart';

//TODO: ADD SEARCH DARK TEXT IN BAR
class AnimeSearchDelegate extends SearchDelegate {
  final animeSearchService = APIService();
  final searchMode = 'substring';
  final ThemeController themeController = Get.find();

  @override
  List<Widget> buildActions(BuildContext context) {
    if (query.isEmpty) {
      return [];
    } else {
      return [
        IconButton(
          icon: Icon(
            Icons.clear,
            color: themeController.isDarkMode.value ? kLightColor : kDarkColor,
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
      icon: Icon(
        Icons.arrow_back,
        color: themeController.isDarkMode.value ? kLightColor : kDarkColor,
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
        color: themeController.isDarkMode.value ? kDarkColor : kPaleLavender,
        child: Center(
          child: Text(
            'Enter an Anime name to search',
            style: kLightSmallThemeText(themeController, kSmallText + 1),
          ),
        ),
      );
    } else {
      return Container(
        color: themeController.isDarkMode.value ? kDarkColor : kPaleLavender,
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
              return Center(
                child: Text(
                  'An error occurred',
                  style: kLightSmallThemeText(themeController, kSmallText + 1),
                ),
              );
            } else {
              final searchResults = snapshot.data ?? [];
              if (searchResults.isEmpty) {
                return Center(
                  child: Text(
                    'No results found',
                    style:
                        kLightSmallThemeText(themeController, kSmallText + 1),
                  ),
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
                      Get.to(() => AnimeCardWidget(
                            anime: anime,
                          ));
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
                            style: kLightSmallThemeText(
                                themeController, kSmallText + 1),
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
      appBarTheme: AppBarTheme(
        color: themeController.isDarkMode.value ? kDarkColor : kPaleLavender,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ),
    );
  }
}
