import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:my_anime_list/constants.dart';

import '../models/anime_model.dart';
import '../models/manga_model.dart';

class APIService {
  final Dio _dio = Dio();

  Future<List<AnimeModel>> fetchTopAnime(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);

      if (response.statusCode == 200) {
        final dynamic responseData = response.data;
        final List<dynamic> topAnimeList = responseData['data'];

        List<AnimeModel> topAnimes =
            topAnimeList.map((anime) => AnimeModel.fromJson(anime)).toList();

        return topAnimes;
      } else {
        if (kDebugMode) {
          print('Failed to fetch top animes: ${response.statusCode}');
        }
        return [];
      }
    } catch (e) {
      if (kDebugMode) {
        print('Failed to fetch top animes: $e');
      }
      return [];
    }
  }

  Future<List<MangaModel>> fetchTopManga(String endpoint) async {
    try {
      final response = await _dio.get(kTopMangaEndpoint);

      if (response.statusCode == 200) {
        final dynamic responseData = response.data;
        final dynamic topMangaList = responseData['data'];
        final List<MangaModel> topManga = topMangaList
            .map((manga) => MangaModel.fromJson(manga))
            .toList()
            .cast<MangaModel>();
        return topManga;
      } else {
        if (kDebugMode) {
          print('Failed to fetch top mangas: ${response.statusCode}');
        }
      }
      return [];
    } catch (e) {
      if (kDebugMode) {
        print('Failed to fetch top mangas: $e');
      }
      return [];
    }
  }

  Future<List<dynamic>> searchAnime({
    required String query,
    String? type,
    double? score,
    String? status,
    String? rating,
    bool? sfw,
    String? genres,
    String? searchMode,
  }) async {
    try {
      final Map<String, dynamic> queryParameters = {
        'q': query,
        if (type != null) 'type': type,
        if (score != null) 'score': score,
        if (status != null) 'status': status,
        if (rating != null) 'rating': rating,
        if (sfw != null) 'sfw': sfw.toString(),
        if (genres != null) 'genres': genres,
      };

      final response =
          await _dio.get(kSearchEndpoint, queryParameters: queryParameters);

      if (response.statusCode == 200) {
        final responseData = response.data;
        final searchResults = responseData['data'];

        if (searchMode == 'substring') {
          // Filter search results using substring matching
          final filteredResults = searchResults.where((anime) {
            final title = anime['title'].toString().toLowerCase();
            return title.contains(query.toLowerCase());
          }).toList();

          return filteredResults;
        } else {
          // Return the original search results
          return searchResults;
        }
      } else {
        throw Exception('Failed to fetch anime data');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
