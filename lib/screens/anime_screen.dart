import 'package:flutter/material.dart';
import 'package:my_anime_list/constants.dart';
import 'package:my_anime_list/models/anime_model.dart';

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
                        fontSize: 20,
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
                itemBuilder: (context, index) => Container(
                  width: size.width * 0.4,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Image.asset(
                        animes[index].image,
                        width: double.infinity,
                        height: size.height * 0.25,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10),
                      Text(
                        animes[index].title,
                        style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Episodes: ${animes[index].epsiodes}',
                        style: TextStyle(
                          color: kSecondaryColor.withOpacity(0.6),
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Score: ${animes[index].score}',
                        style: TextStyle(
                          color: kSecondaryColor.withOpacity(0.6),
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Duration: ${animes[index].duration} mins',
                        style: TextStyle(
                          color: kSecondaryColor.withOpacity(0.6),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
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
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: size.height * 0.4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: animes.length,
                itemBuilder: (context, index) => Container(
                  width: size.width * 0.4,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Image.asset(
                        animes[index].image,
                        width: double.infinity,
                        height: size.height * 0.25,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10),
                      Text(
                        animes[index].title,
                        style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Episodes: ${animes[index].epsiodes}',
                        style: TextStyle(
                          color: kSecondaryColor.withOpacity(0.6),
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Score: ${animes[index].score}',
                        style: TextStyle(
                          color: kSecondaryColor.withOpacity(0.6),
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Duration: ${animes[index].duration} mins',
                        style: TextStyle(
                          color: kSecondaryColor.withOpacity(0.6),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
