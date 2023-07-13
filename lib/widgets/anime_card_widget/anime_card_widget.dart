import 'package:flutter/material.dart';

import 'package:my_anime_list/constants.dart';
import 'package:my_anime_list/models/anime_model.dart';
import 'package:my_anime_list/widgets/favorite_button_widget.dart';
import 'package:my_anime_list/widgets/anime_card_widget/play_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../more_info_Widget.dart';

class AnimeCardWidget extends StatelessWidget {
  final AnimeModel anime;
  const AnimeCardWidget({
    Key? key,
    required this.anime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: kVeryLightPurple,
        iconTheme: const IconThemeData(color: kSecondaryColor),
        title: Text(
          anime.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: myTextStyle(kBigText),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  kVeryLightPurple,
                  kPaleLavender,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            bottom: 50.h,
            left: 0.w,
            right: 0.w,
            child: Container(
              height: 420.h,
              padding: EdgeInsets.only(top: 120.h),
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(kBorderRadius),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 4),
                    blurRadius: 6,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: DefaultTabController(
                length: 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 75.h,
                            width: 75.w,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
                              child: Image.network(
                                anime.image,
                                fit: BoxFit.cover,
                                width: double.infinity.w,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: 175.w,
                                child: Text(
                                  anime.title,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: myTextStyle(kSmallText),
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                children: [
                                  Text(
                                    '${anime.episodes} Episodes -',
                                    style: TextStyle(
                                      fontSize: kDefaultPadding,
                                      fontFamily: kDefaultFont,
                                    ),
                                  ),
                                  SizedBox(width: 3.w),
                                  Text(
                                    'Duration: ${anime.duration}',
                                    style: TextStyle(
                                      fontSize: kDefaultPadding,
                                      fontFamily: kDefaultFont,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Score',
                                style: TextStyle(
                                  fontSize: kDefaultPadding,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: kDefaultFont,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Container(
                                height: 25.h,
                                width: 37.w,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      kPinkishPurple,
                                      kBluishPurple,
                                    ],
                                  ),
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
                                      color: Colors.white,
                                      fontSize: kDefaultPadding,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: kDefaultFont,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const TabBar(
                        tabs: [
                          Tab(text: 'Overview'),
                          Tab(text: 'More info'),
                          Tab(text: 'Episodes'),
                        ],
                        labelColor: kSecondaryColor,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: kPrimaryColor,
                      ),
                      Container(
                        height: 125.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(kBorderRadius),
                            topRight: Radius.circular(kBorderRadius),
                          ),
                        ),
                        child: TabBarView(
                          children: [
                            SingleChildScrollView(
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: kDefaultPadding,
                                    horizontal: kDefaultPadding),
                                child: Text(
                                  anime.synopsis,
                                  style: TextStyle(
                                    fontSize: 12.5.sp,
                                    fontFamily: kDefaultFont,
                                  ),
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: kDefaultPadding,
                                  horizontal: kDefaultPadding,
                                ),
                                padding: EdgeInsets.all(kDefaultPadding),
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius:
                                      BorderRadius.circular(kBorderRadius),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    moreInfoWidget('Rank', anime.rank, 10.w),
                                    moreInfoWidget(
                                        'Scored by', anime.scoredBy, 10.w),
                                    moreInfoWidget(
                                        'Popularity', anime.popularity, 10.w),
                                    moreInfoWidget(
                                        'Favorites', anime.favorites, 10.w),
                                    moreInfoWidget('Year', anime.year, 10.w),
                                    moreInfoWidget(
                                        'Season', anime.season, 10.w),
                                  ],
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'Watching anime without paying is illegal :)',
                                style: TextStyle(
                                  fontSize: 12.5.sp,
                                  fontFamily: kDefaultFont,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        child: FavoriteButtonWidget(anime: anime),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 30.h, horizontal: 75.w),
            height: 200.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorderRadius),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 4),
                  blurRadius: 6,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kBorderRadius),
              child: Image.network(
                anime.image,
                fit: BoxFit.cover,
                width: double.infinity.w,
              ),
            ),
          ),
          PlayButton(anime: anime),
        ],
      ),
    );
  }
}
