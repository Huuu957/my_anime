import 'package:flutter/material.dart';
import 'package:my_anime_list/constants.dart';

class MangaScreen extends StatelessWidget {
  const MangaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPaleLavender,
      body: Center(child: Text('Manga Here')),
    );
  }
}
