import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_anime/locale/locale_controller.dart';
import '../api/anime_search_delegate.dart';
import '../constants.dart';
import 'anime_screen.dart';
import '../screens/manga_screen.dart';
import '../controller/favorite_controller.dart';
import '../controller/theme_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final FavoriteController favoriteController = Get.find();
  final ThemeController themeController = Get.find();
  final MyLocaleController localeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.h),
            child: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor:
                  themeController.isDarkMode.value ? kDarkColor : kPaleLavender,
              title: Text(
                '1'.tr,
                style: kLightBoldLargeThemeText(themeController, kBigText + 1),
              ),
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      color:
                          kLightLargeThemeText(themeController, kBigText).color,
                    ),
                  );
                },
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: AnimeSearchDelegate(),
                    );
                  },
                  icon: Icon(
                    Icons.search,
                    color:
                        kLightLargeThemeText(themeController, kBigText).color,
                  ),
                ),
              ],
              bottom: TabBar(
                indicatorColor: kPrimaryColor,
                indicatorSize: TabBarIndicatorSize.label,
                labelPadding:
                    EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
                tabs: [
                  Text(
                    'Anime',
                    style: kLightLargeThemeText(themeController, kBigText),
                  ),
                  Text(
                    'Manga',
                    style: kLightLargeThemeText(themeController, kBigText),
                  ),
                ],
              ),
            ),
          ),
          drawer: Drawer(
            child: Container(
              color:
                  themeController.isDarkMode.value ? kDarkColor : kPaleLavender,
              child: ListView(
                shrinkWrap: true,
                children: [
                  const DrawerHeader(
                    child: Text('Drawer Header'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListTile(
                        title: Text(
                          'Dark mode',
                          style: kLightLargeThemeText(
                              themeController, kBigText - 1),
                        ),
                        trailing: Transform.scale(
                          scale: 0.8.w,
                          child: CupertinoSwitch(
                            value: themeController.isDarkMode.value,
                            onChanged: (bool value) {
                              themeController.toggleTheme();
                            },
                            activeColor: kPrimaryColor,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPadding + 5),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          icon: const Icon(Icons.arrow_forward),
                          value: Get.locale?.languageCode,
                          items: [
                            DropdownMenuItem(
                              value: 'en',
                              child: Text(
                                'English',
                                style: TextStyle(
                                  color: themeController.isDarkMode.value
                                      ? kLightColor
                                      : kDarkColor,
                                  fontFamily: kDefaultFont,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'de',
                              child: Text(
                                'German',
                                style: TextStyle(
                                  color: themeController.isDarkMode.value
                                      ? kLightColor
                                      : kDarkColor,
                                  fontFamily: kDefaultFont,
                                ),
                              ),
                            ),
                          ],
                          onChanged: (String? selectedLang) {
                            if (selectedLang != null) {
                              localeController.changeLang(selectedLang);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              AnimeScreen(),
              MangaScreen(themeController: themeController),
            ],
          ),
        ),
      ),
    );
  }
}
