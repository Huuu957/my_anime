import 'package:flutter/material.dart';
import '../../constants.dart';
import 'more_media_screen.dart';

class MoreMovieScreen extends StatelessWidget {
  const MoreMovieScreen({Key? key}) : super(key: key);
  static const moreMovieScreen = '/moreMovieScreen';

  @override
  Widget build(BuildContext context) {
    return const MoreMediaScreen(
      endpoint: kTopMovieEndpoint,
    );
  }
}
