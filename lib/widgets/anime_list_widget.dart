import 'package:flutter/material.dart';
import 'package:my_anime_list/constants.dart';
import 'package:get/get.dart';
import 'package:my_anime_list/api/dio_services.dart';
import 'package:my_anime_list/models/anime_model.dart';

import 'anime_card_widget.dart';

class AnimeListWidget extends StatelessWidget {
  AnimeListWidget({
    Key? key,
    required this.size,
    required this.apiMethod,
  }) : super(key: key);

  final Size size;
  final Future<List<AnimeModel>> Function() apiMethod;
  final APIService apiService = APIService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AnimeModel>>(
      future: apiMethod(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<AnimeModel> animes = snapshot.data!;

          return SizedBox(
            height: size.height * 0.36,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: animes.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Get.to(() => AnimeCardWidget(
                        anime: animes[index],
                      ));
                },
                child: Container(
                  width: size.width * 0.4,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: kSecondaryColor,
                          fontSize: kBigText,
                          fontFamily: kDefaultFont,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Text(
                            'Score: ',
                            style: TextStyle(
                              color: kSecondaryColor,
                              fontSize: 12,
                              fontFamily: kDefaultFont,
                            ),
                          ),
                          Container(
                            height: 17,
                            width: 40,
                            decoration: const BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.elliptical(100, 100),
                                right: Radius.elliptical(100, 100),
                              ),
                            ),
                            padding: EdgeInsets.zero, // Remove all padding
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '${animes[index].score}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: kDefaultPadding,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: kDefaultFont,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: kDefaultPadding / 2),
                      Row(
                        children: [
                          Text(
                            '${animes[index].episodes} Eps - ',
                            style: TextStyle(
                              color: kSecondaryColor.withOpacity(0.6),
                              fontSize: 12,
                              fontFamily: kDefaultFont,
                            ),
                          ),
                          Text(
                            animes[index].duration,
                            style: TextStyle(
                              color: kSecondaryColor.withOpacity(0.6),
                              fontSize: 12,
                              fontFamily: kDefaultFont,
                            ),
                          ),
                        ],
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
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
