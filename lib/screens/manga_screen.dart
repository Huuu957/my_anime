import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_anime/controller/manga_controller.dart';
import 'package:my_anime/controller/theme_controller.dart';
import '../widgets/manga_card_widget.dart';
import '../constants.dart';

import 'package:get/get.dart';

class MangaScreen extends StatelessWidget {
  MangaScreen({Key? key, required this.themeController}) : super(key: key);

  final ThemeController themeController;
  final MangaController mangaController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPaleLavender,
      body: Obx(
        () => Container(
          color: themeController.isDarkMode.value ? kDarkColor : kPaleLavender,
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 250.w,
            ),
            itemCount: mangaController.mangaList.length,
            itemBuilder: (context, index) {
              final manga = mangaController.mangaList[index];
              return Container(
                margin: EdgeInsets.symmetric(
                  vertical: kDefaultPadding,
                  horizontal: kDefaultPadding - 5,
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => MangaCardWidget(manga: manga));
                      },
                      child: SizedBox(
                        width: 100.w,
                        height: 140.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(kBorderRadius),
                          child: Image.network(
                            manga.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      manga.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: kLightLargeThemeText(themeController, kBigText),
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Score: ',
                          style: kLightSmallThemeText(
                              themeController, kSmallText + 2),
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
                          padding: EdgeInsets.zero,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '${manga.score}',
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
          ),
        ),
      ),
    );
  }
}
