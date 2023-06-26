import 'package:flutter/material.dart';
import 'package:my_anime_list/constants.dart';
import 'package:my_anime_list/models/anime_model.dart';
import 'package:get/get.dart';
import 'package:my_anime_list/screens/anime_screens/anime_card.dart';
import 'package:my_anime_list/screens/anime_screens/list_view_container.dart';

class AnimeScreen extends StatelessWidget {
  const AnimeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15),
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Row(
                children: [
                  Container(
                    child: Text(
                      'Top Animes',
                      style: TextStyle(
                        color: kSecondaryColor,
                        fontSize: 17.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: size.height * 0.4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: animes.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Get.toNamed(AnimeCard.animeCardRoute,
                        arguments: animes[index]);
                  },
                  child: ListViewContainer(size: size),
                ),
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Row(
                children: [
                  Container(
                    child: Text(
                      'Most Watched',
                      style: TextStyle(
                        color: kSecondaryColor,
                        fontSize: 17.5,
                      ),
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
