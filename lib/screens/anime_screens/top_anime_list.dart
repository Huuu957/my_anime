import 'package:flutter/material.dart';
import 'package:my_anime_list/api/dio_services.dart';
import 'package:my_anime_list/constants.dart';
import 'package:my_anime_list/widgets/anime_list_widget.dart';

class TopAnimeList extends StatelessWidget {
  TopAnimeList({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  final APIService apiService = APIService();

  @override
  Widget build(BuildContext context) {
    return AnimeListWidget(
      size: size,
      apiMethod: () => apiService.fetchTopAnime(kTopAnimeEndpoint),
    );
  }
}
