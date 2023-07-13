import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_anime_list/api/anime_search_delegate.dart';
import 'package:my_anime_list/constants.dart';
import 'package:my_anime_list/screens/anime_screens/anime_screen.dart';
import 'package:my_anime_list/screens/manga_screen.dart';

import '../controller/favorite_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.put(FavoriteController(), permanent: true);

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
              backgroundColor: kPaleLavender,
              centerTitle: true,
              title: Text(
                'Browse Anime',
                style: myTextStyle(kBigText + 5),
              ),
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: kSecondaryColor,
                    ),
                  );
                },
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    showSearch(
                        context: context, delegate: AnimeSearchDelegate());
                  },
                  icon: const Icon(
                    Icons.search,
                    color: kSecondaryColor,
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
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: kDefaultPadding * 1.75,
                      fontFamily: kDefaultFont,
                    ),
                  ),
                  Text(
                    'Manga',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: kDefaultPadding * 1.75,
                      fontFamily: kDefaultFont,
                    ),
                  ),
                ],
              ),
            ),
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: kPaleLavender,
                  ),
                  child: Text(
                    'Drawer Header',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: 24.sp,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text('Switch'),
                  trailing: Switch(
                    value: false,
                    onChanged: (bool value) {
                      if (kDebugMode) {
                        print('Switch Pressed');
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              AnimeScreen(),
              MangaScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
