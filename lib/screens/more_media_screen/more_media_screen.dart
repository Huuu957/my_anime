import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_anime/controller/theme_controller.dart';
import '../../constants.dart';
import 'package:get/get.dart';

import '../../../api/dio_services.dart';
import '../../../models/anime_model.dart';
import '../../../widgets/anime_card_widget/anime_card_widget.dart';

class MoreMedia extends StatelessWidget {
  const MoreMedia({Key? key}) : super(key: key);
  static const moreAnimeScreenRoute = '/moreAnimeScreenRoute';

  @override
  Widget build(BuildContext context) {
    return MoreMediaScreen(
      endpoint: kTopAnimeEndpoint,
    );
  }
}

class MoreMediaScreen extends StatelessWidget {
  final String endpoint;
  final ThemeController themeController = Get.find();

  MoreMediaScreen({Key? key, required this.endpoint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          themeController.isDarkMode.value ? kDarkColor : kPaleLavender,
      appBar: AppBar(
        backgroundColor:
            themeController.isDarkMode.value ? kDarkColor : kPaleLavender,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color:
              themeController.isDarkMode.value ? kLightColor : kSecondaryColor,
          onPressed: () => Get.back(),
        ),
      ),
      body: FutureBuilder<List<AnimeModel>>(
        future: APIService().fetchTopAnime(endpoint),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
              ),
            );
          } else if (snapshot.hasData) {
            final animes = snapshot.data!;
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 220.h,
              ),
              itemCount: animes.length,
              itemBuilder: (context, index) {
                final anime = animes[index];
                return Container(
                  margin: EdgeInsets.symmetric(
                    vertical: kDefaultPadding,
                    horizontal: kDefaultPadding - 5,
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                  () => AnimeCardWidget(anime: animes[index]));
                            },
                            child: AspectRatio(
                              aspectRatio: 2 / 3,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(kBorderRadius),
                                child: Image.network(
                                  anime.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        animes[index].title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: kBoldText(themeController, kSmallText),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            anime.airing ? 'airing' : 'not airing',
                            style: kLightText(themeController, kSmallText - 1),
                          ),
                          SizedBox(width: 5.w),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Score: ',
                              style:
                                  kLightText(themeController, kSmallText - 1),
                            ),
                          ),
                          Container(
                            height: 17.h,
                            width: 30.w,
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
                                style: TextStyle(
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
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Failed to fetch anime data'),
            );
          }
          return const Center(
            child: Text('No data available'),
          );
        },
      ),
    );
  }
}
