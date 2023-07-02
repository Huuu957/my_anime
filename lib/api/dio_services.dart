import 'package:dio/dio.dart';

import '../models/anime_model.dart';

class APIService {
  final Dio _dio = Dio();

  Future<List<AnimeModel>> fetchTopAnimes() async {
    try {
      final response = await _dio.get('https://api.jikan.moe/v4/top/anime');

      if (response.statusCode == 200) {
        final List<dynamic> animeList = response.data['top'];

        return animeList
            .map((anime) => AnimeModel(
                  id: anime['mal_id'].toString(),
                  image: anime['image_url'],
                  title: anime['title'],
                  score: anime['score'].toDouble(),
                  episodes: anime['episodes'],
                  duration: anime['duration'].toDouble(),
                  description: anime['synopsis'],
                ))
            .toList();
      } else {
        // Handle error
        print('Failed to fetch top animes: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      // Handle error
      print('Failed to fetch top animes: $e');
      return [];
    }
  }
}
