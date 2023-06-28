import 'package:flutter/material.dart';
import 'package:my_anime_list/constants.dart';
import 'package:my_anime_list/screens/anime_screens/list_view_container.dart';

class AnimeScreen extends StatelessWidget {
  const AnimeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPaleLavender,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15),
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: const Row(
                children: [
                  Text(
                    'Top Animes',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: 17.5,
                    ),
                  ),
                ],
              ),
            ),
            ListViewContainer(size: size),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: const Row(
                children: [
                  Text(
                    'Most Watched',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: 17.5,
                    ),
                  ),
                ],
              ),
            ),
            ListViewContainer(size: size),
          ],
        ),
      ),
    );
  }
}
