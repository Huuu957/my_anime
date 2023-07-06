import 'package:flutter/material.dart';
import 'package:my_anime_list/constants.dart';

class MoreAnimeScreen extends StatelessWidget {
  const MoreAnimeScreen({Key? key}) : super(key: key);
  static const moreAnimeScreenRoute = '/moreAnimeScreenRoute';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPaleLavender,
      body: Center(
        child: Text('More'),
      ),
    );
  }
}
