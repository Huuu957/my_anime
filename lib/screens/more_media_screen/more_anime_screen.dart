import 'package:flutter/material.dart';
import '../../constants.dart';
import 'more_media_screen.dart';

class MoreAnimeScreen extends StatelessWidget {
  const MoreAnimeScreen({Key? key}) : super(key: key);
  static const moreAnimeScreenRoute = '/moreAnimeScreenRoute';

  @override
  Widget build(BuildContext context) {
    return const MoreMediaScreen(
      endpoint: kTopAnimeEndpoint,
    );
  }
}
