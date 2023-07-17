import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../models/manga_model.dart';

import 'more_info_Widget.dart';

class MangaCardWidget extends StatelessWidget {
  const MangaCardWidget({super.key, required this.manga});

  final MangaModel manga;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kVeryLightPurple,
      appBar: AppBar(
        title: Text(
          manga.title,
          style: boldTextStyle(kBigText),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kVeryLightPurple,
        iconTheme: const IconThemeData(color: kSecondaryColor),
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
                            width: 175.w,
                            child: Text(
                              manga.title,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: boldTextStyle(kSmallText),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            'Score',
                            style: TextStyle(
                              fontSize: kDefaultPadding,
                              fontWeight: FontWeight.w400,
                              fontFamily: kDefaultFont,
                            ),
                          ),
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
                            padding: EdgeInsets.zero,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '${manga.score}',
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
                      const TabBar(
                        tabs: [
                          Tab(text: 'Overview'),
                          Tab(text: 'More Info'),
                          Tab(text: 'History'),
                        ],
                        labelColor: kSecondaryColor,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: kPrimaryColor,
                      ),
                      Container(
                        height: 150.h,
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
                                  horizontal: kDefaultPadding,
                                ),
                                child: Text(
                                  manga.synopsis,
                                  style: lightTextStyle(kSmallText + 1),
                                ),
                              ),
                            ),
                            Center(
                              child: SingleChildScrollView(
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
                                      moreInfoWidget('Rank', manga.rank, 10.w),
                                      moreInfoWidget(
                                          'Scored by', manga.scoredBy, 10.w),
                                      moreInfoWidget(
                                          'Popularity', manga.popularity, 10.w),
                                      moreInfoWidget(
                                          'Favorites', manga.favorites, 10.w),
                                    ],
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
                                child: Text(
                                  manga.background,
                                  style: lightTextStyle(kSmallText + 1),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                manga.image,
                fit: BoxFit.cover,
                width: double.infinity.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
