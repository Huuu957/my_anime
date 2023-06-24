import 'package:flutter/material.dart';
import 'package:my_anime_list/models/anime_model.dart';
import 'package:my_anime_list/constants.dart';

class AnimeCard extends StatelessWidget {
  final Anime anime;

  AnimeCard({required this.anime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: kSecondaryColor),
        title: Text(
          anime.title,
          style: TextStyle(color: kSecondaryColor),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 250,
            margin: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 75),
                height: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    anime.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 75,
                    width: 75,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        anime.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        child: Text(anime.title),
                      ),
                      SizedBox(height: kDefaultPadding),
                      Row(
                        children: [
                          Text(
                            '${anime.episodes} Episodes',
                            style: TextStyle(
                              fontSize: kDefaultPadding,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: kDefaultPadding * 2),
                          Text(
                            'Duration: ${anime.duration} mins',
                            style: TextStyle(
                              fontSize: kDefaultPadding,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Score',
                        style: TextStyle(
                          fontSize: kDefaultPadding,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: kDefaultPadding / 2),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.elliptical(100, 100),
                            right: Radius.elliptical(100, 100),
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '${anime.score}',
                          style: TextStyle(
                            fontSize: kDefaultPadding,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
