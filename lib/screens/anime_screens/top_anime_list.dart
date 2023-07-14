import 'package:flutter/material.dart';
import '../../api/dio_services.dart';
import '../../constants.dart';
import '../../widgets/anime_list_widget.dart';

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
