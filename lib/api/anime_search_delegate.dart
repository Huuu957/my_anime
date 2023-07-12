import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_anime_list/api/dio_services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AnimeSearchDelegate extends SearchDelegate {
  final animeSearchService = APIService();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
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
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Text('Enter a keyword to search'),
      );
    } else {
      return FutureBuilder<List<dynamic>>(
        future: animeSearchService.searchAnime(query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final searchResults = snapshot.data;

            if (searchResults!.isEmpty) {
              return const Center(
                child: Text('No results found'),
              );
            }

            return ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final genre = searchResults?[index];
                return ListTile(
                  title: Text(genre['name']),
                  onTap: () {
                    // Handle the tap on a search result
                    // For example, you can open the URL in a web view:
                    //TODO: ADD WEB VIEW HERE
                    Get.to(() => null);
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('An error occurred'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }
  }
}
