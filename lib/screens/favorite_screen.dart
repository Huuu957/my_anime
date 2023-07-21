import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/theme_controller.dart';
import '../constants.dart';
import '../controller/favorite_controller.dart';

class FavoriteScreen extends StatelessWidget {
  final ThemeController themeController;
  final FavoriteController favoriteController = Get.find();

  FavoriteScreen({Key? key, required this.themeController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          themeController.isDarkMode.value ? kDarkColor : kPaleLavender,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor:
            themeController.isDarkMode.value ? kDarkColor : kPaleLavender,
        title: Text(
          'Favorites',
          style: kBoldThemeText(themeController, kBigText + 2.5),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0.h),
          child: Container(
            color: themeController.isDarkMode.value ? kLightColor : kDarkColor,
            height: 1.0.h,
          ),
        ),
      ),
      body: Obx(
        () => favoriteController.favList.isEmpty
            ? Center(
                child: Text(
                  'Your Favorites Collection is Empty',
                  style: kLightSmallThemeText(themeController, kSmallText + 2),
                ),
              )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75.w,
                ),
                itemCount: favoriteController.favList.length,
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                  onTap: () {
                    favoriteController
                        .goToAnimeDetails(favoriteController.favList[index]);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(kDefaultPadding),
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(kBorderRadius),
                            child: Image.network(
                                favoriteController.favList[index].image),
                          ),
                        ),
                        SizedBox(height: kDefaultPadding),
                        Text(
                          favoriteController.favList[index].title,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style:
                              kBoldThemeText(themeController, kSmallText + 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
