import 'package:flutter/material.dart';
import '../../api/dio_services.dart';
import '../../widgets/anime_list_widget.dart';

import '../../constants.dart';

class TopMovieList extends StatelessWidget {
  TopMovieList({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  final APIService apiService = APIService();

  @override
  Widget build(BuildContext context) {
    return AnimeListWidget(
      size: size,
      apiMethod: () => apiService.fetchTopAnime(kTopMovieEndpoint),
    );
  }
}
