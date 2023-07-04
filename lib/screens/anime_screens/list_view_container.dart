import 'package:flutter/material.dart';
import '../../controller/favorite_controller.dart';
import 'anime_card.dart';
import 'package:my_anime_list/constants.dart';
import 'package:get/get.dart';
import 'package:my_anime_list/api/dio_services.dart';
import 'package:my_anime_list/models/anime_model.dart';

class ListViewContainer extends StatelessWidget {
  ListViewContainer({
    Key? key,
    required this.size,
  });

  final Size size;
  final controller = Get.put(FavoriteController(), permanent: true);
  final APIService apiService = APIService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AnimeModel>>(
      future: apiService.fetchTopAnimes(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<AnimeModel> animes = snapshot.data!;

          return SizedBox(
            height: size.height * 0.4,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: animes.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Get.to(AnimeCard(anime: animes[index]));
                },
                child: Container(
                  width: size.width * 0.4,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                        child: Image.network(
                          animes[index].image,
                          width: double.infinity,
                          height: size.height * 0.25,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        animes[index].title,
                        style: const TextStyle(
                          color: kSecondaryColor,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
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
                        animes[index].duration,
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
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
