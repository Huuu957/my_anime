import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/anime_model.dart';

class APIService {
  final Dio _dio = Dio();

  Future<List<AnimeModel>> fetchTop(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);

      if (response.statusCode == 200) {
        final dynamic responseData = response.data;

        final List<dynamic> animeList = responseData['data'];

        // Process the animeList and convert it into AnimeModel objects
        List<AnimeModel> topAnimes = animeList.map((anime) {
          final String id = anime['mal_id'].toString();
          final String image = anime['images']['jpg']['image_url'];
          final String title = anime['title'];
          final double score = anime['score'].toDouble();
          final int episodes = anime['episodes'];
          final String duration = anime['duration'];
          final String description = anime['synopsis'];

          return AnimeModel(
            id: id,
            image: image,
            title: title,
            score: score,
            episodes: episodes,
            duration: duration,
            description: description,
          );
        }).toList();

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
