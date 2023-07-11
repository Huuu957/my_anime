import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/anime_model.dart';

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
}
