import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../api/anime_search_delegate.dart';
import '../constants.dart';
import 'anime_screen.dart';
import '../screens/manga_screen.dart';
import '../controller/favorite_controller.dart';
import '../controller/theme_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final FavoriteController controller =
      Get.put(FavoriteController(), permanent: true);
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.h),
            child: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Get.theme.appBarTheme.backgroundColor,
              title: Text(
                'Browse Anime',
                style: lightBoldThemeText(themeController, kBigText + 1),
              ),
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      color: lightThemeText(themeController, kBigText).color,
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
                    color: lightThemeText(themeController, kBigText).color,
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
                    style: lightThemeText(themeController, kBigText),
                  ),
                  Text(
                    'Manga',
                    style: lightThemeText(themeController, kBigText),
                  ),
                ],
              ),
            ),
          ),
          drawer: Drawer(
            child: Container(
              color: Theme.of(context).canvasColor,
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Text(
                      'Drawer Header',
                      style: lightBoldThemeText(themeController, 24.sp),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Dark mode',
                      style: lightThemeText(themeController, kBigText - 1),
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
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              AnimeScreen(),
              const MangaScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
