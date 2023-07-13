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

  Future<List<dynamic>> searchAnime(String keyword) async {
    try {
      final response = await _dio.get(kSearchEndpoint);
      if (response.statusCode == 200) {
        final responseData = response.data;
        final animesSearch = responseData['data'];
        final filteredAnimes = animesSearch
            .where((anime) => anime['title']
                .toString()
                .toLowerCase()
                .contains(keyword.toLowerCase()))
            .toList();
        return filteredAnimes;
      } else {
        throw Exception('Failed to fetch anime data');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
