import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import 'package:get/get.dart';
import '../api/dio_services.dart';
import '../models/anime_model.dart';

import 'anime_card_widget/anime_card_widget.dart';

class AnimeListWidget extends StatelessWidget {
  AnimeListWidget({
    Key? key,
    required this.apiMethod,
  }) : super(key: key);

  final Future<List<AnimeModel>> Function() apiMethod;
  final APIService apiService = APIService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AnimeModel>>(
      future: apiMethod(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final List<AnimeModel> animes = snapshot.data!;
          final int itemCount = animes.length < 6 ? animes.length : 6;

          return SizedBox(
            height: 250.h,
            width: 400.w,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: itemCount,
              itemBuilder: (context, index) {
                final AnimeModel anime = animes[index];
                return InkWell(
                  onTap: () {
                    Get.to(() => AnimeCardWidget(anime: anime));
                  },
                  child: Container(
                    width: 150.w,
                    margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(kBorderRadius),
                            child: Image.network(
                              anime.image,
                              width: double.infinity,
                              height: 130.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: kDefaultPadding),
                        Text(
                          anime.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: kSecondaryColor,
                            fontSize: kBigText,
                            fontFamily: kDefaultFont,
                          ),
                        ),
                        SizedBox(height: kDefaultPadding / 2),
                        Row(
                          children: [
                            Text(
                              'Score: ',
                              style: TextStyle(
                                color: kSecondaryColor,
                                fontSize: 12.sp,
                                fontFamily: kDefaultFont,
                              ),
                            ),
                            Container(
                              height: 17.h,
                              width: 40.w,
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
                                  '${anime.score}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: kSmallText,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: kDefaultFont,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: kDefaultPadding / 2),
                        Row(
                          children: [
                            Text(
                              '${anime.episodes} Eps - ',
                              style: TextStyle(
                                color: kSecondaryColor.withOpacity(0.6),
                                fontSize: kSmallText + 2,
                                fontFamily: kDefaultFont,
                              ),
                            ),
                            Text(
                              anime.duration,
                              style: TextStyle(
                                color: kSecondaryColor.withOpacity(0.6),
                                fontSize: kSmallText + 2,
                                fontFamily: kDefaultFont,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
