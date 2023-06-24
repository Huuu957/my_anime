import 'package:flutter/material.dart';
import 'package:my_anime_list/models/anime_model.dart';
import 'anime_card.dart';
import 'package:my_anime_list/constants.dart';

class ListViewContainer extends StatelessWidget {
  const ListViewContainer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.4,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: animes.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnimeCard(anime: animes[index]),
                ));
          },
          child: Container(
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
                  'Episodes: ${animes[index].episodes}',
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
    );
  }
}
