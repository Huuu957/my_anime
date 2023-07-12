import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_anime_list/api/dio_services.dart';

import '../constants.dart';
import '../models/anime_model.dart';

class AnimeSearchDelegate extends SearchDelegate {
  final animeSearchService = APIService();

  @override
  List<Widget> buildActions(BuildContext context) {
    if (query.isEmpty) {
      return [];
    } else {
      return [
        IconButton(
          icon: const Icon(Icons.clear),
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
      icon: const Icon(Icons.arrow_back),
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
      return const Center(
        child: Text('Enter an Anime name to search'),
      );
    } else {
      return FutureBuilder<List<dynamic>>(
        future: animeSearchService.searchAnime(query),
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

            return ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final anime = AnimeModel.fromJson(searchResults[index]);
                return ListTile(
                  leading: Image.network(anime.image),
                  title: Text(anime.title),
                  onTap: () {
                    // Handle the tap on a search result
                    // For example, you can open the URL in a web view:
                    Get.to(() => null);
                  },
                );
              },
            );
          }
        },
      );
    }
  }
}