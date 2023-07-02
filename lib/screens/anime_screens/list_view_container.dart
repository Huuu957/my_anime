import 'package:flutter/material.dart';
import 'package:my_anime_list/models/anime_model.dart';
import '../../api/dio_services.dart';
import '../../controller/favorite_controller.dart';
import 'anime_card.dart';
import 'package:my_anime_list/constants.dart';
import 'package:get/get.dart';

class ListViewContainer extends StatelessWidget {
  final Size size;
  final controller = Get.put(FavoriteController(), permanent: true);
  final APIService apiService = APIService();

  ListViewContainer({
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AnimeModel>>(
      future: apiService.fetchTopAnimes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final List<AnimeModel> fetchedAnimes = snapshot.data!;
          print('It Worked');

          return SizedBox(
            height: size.height * 0.4,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: fetchedAnimes.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Get.to(AnimeCard(anime: fetchedAnimes[index]));
                },
                child: Container(
                  width: size.width * 0.4,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                        child: Image.network(
                          fetchedAnimes[index].imageUrl,
                          width: double.infinity,
                          height: size.height * 0.25,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        fetchedAnimes[index].title,
                        style: const TextStyle(
                          color: kSecondaryColor,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Episodes: ${fetchedAnimes[index].episodes}',
                        style: TextStyle(
                          color: kSecondaryColor.withOpacity(0.6),
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Score: ${fetchedAnimes[index].score}',
                        style: TextStyle(
                          color: kSecondaryColor.withOpacity(0.6),
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Duration: ${fetchedAnimes[index].duration} mins',
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
        } else {
          return const Text('No data available');
        }
      },
    );
  }
}
