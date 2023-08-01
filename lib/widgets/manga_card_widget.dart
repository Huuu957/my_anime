import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_anime/controller/theme_controller.dart';
import '../constants.dart';
import '../models/manga_model.dart';
import 'package:get/get.dart';
import 'more_info_Widget.dart';

class MangaCardWidget extends StatelessWidget {
  MangaCardWidget({super.key, required this.manga});

  final MangaModel manga;
  final ThemeController themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    final gradientColors = themeController.isDarkMode.value
        ? [kDarkTeal, kDarkTeal1]
        : [
            kVeryLightPurple,
            kPaleLavender,
          ];
    final gradientScoreColors = themeController.isDarkMode.value
        ? [kDarkTeal, kDarkTeal1]
        : [
            kPinkishPurple,
            kBluishPurple,
          ];
    return Scaffold(
      backgroundColor: kVeryLightPurple,
      appBar: AppBar(
        title: Text(
          manga.title,
          style: kBoldText(themeController, kBigText),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor:
            themeController.isDarkMode.value ? kDarkTeal : kVeryLightPurple,
        iconTheme: IconThemeData(
            color: themeController.isDarkMode.value ? kLightColor : kDarkColor),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          //Floating Container----------------------------------------------
          Positioned(
            bottom: 50.h,
            left: 0.w,
            right: 0.w,
            child: Container(
              height: 420.h,
              padding: EdgeInsets.only(top: 120.h),
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              decoration: BoxDecoration(
                color:
                    themeController.isDarkMode.value ? kDarkGrey : kLightColor,
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
                              style: kBoldText(themeController, kSmallText),
                            ),
                          ),
                          SizedBox(width: kDefaultPadding),
                          Column(
                            children: [
                              Text(
                                'Score',
                                style:
                                    kLightText(themeController, kSmallText - 1),
                              ),
                              Container(
                                height: 25.h,
                                width: 37.w,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: gradientScoreColors,
                                  ),
                                  borderRadius: const BorderRadius.horizontal(
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
                                      fontSize: kSmallText,
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
                      TabBar(
                        tabs: [
                          Tab(text: '13'.tr),
                          Tab(text: '14'.tr),
                          Tab(text: '25'.tr),
                        ],
                        labelColor: themeController.isDarkMode.value
                            ? kLightColor
                            : kDarkColor,
                        indicatorColor: themeController.isDarkMode.value
                            ? kDarkTeal1
                            : kPrimaryColor,
                        indicatorSize: TabBarIndicatorSize.label,
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
                                  style: kLightText(
                                      themeController, kSmallText + 1),
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
                                    color: themeController.isDarkMode.value
                                        ? kDarkTeal1
                                        : kPrimaryColor,
                                    borderRadius:
                                        BorderRadius.circular(kBorderRadius),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      moreInfoWidget('18'.tr, manga.rank, 10.w),
                                      moreInfoWidget(
                                          '19'.tr, manga.scoredBy, 10.w),
                                      moreInfoWidget(
                                          '20'.tr, manga.popularity, 10.w),
                                      moreInfoWidget(
                                          '6'.tr, manga.favorites, 10.w),
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
                                  style: kLightText(
                                      themeController, kSmallText + 1),
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
