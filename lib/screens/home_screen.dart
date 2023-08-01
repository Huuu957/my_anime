import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_anime/locale/locale_controller.dart';
import '../api/anime_search_delegate.dart';
import '../auth.dart';
import '../constants.dart';
import 'anime_screen.dart';
import '../screens/manga_screen.dart';
import '../controller/favorite_controller.dart';
import '../controller/theme_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.userImageUrl}) : super(key: key);
  final String? userImageUrl;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FavoriteController favoriteController = Get.find();

  final ThemeController themeController = Get.find();

  final MyLocaleController localeController = Get.find();

  String? userProfileImageUrl;

  @override
  void initState() {
    super.initState();
    loadUserProfileImageUrl();
  }

  Future<void> loadUserProfileImageUrl() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String? imageUrl = await Auth().getUserProfileImageUrl(user.uid);
        setState(() {
          userProfileImageUrl = imageUrl;
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error loading user profile image: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    String userName = user?.displayName ?? 'Guest';
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
                style: kBoldText(themeController, kBigText + 1),
              ),
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      color: kLightText(themeController, kBigText).color,
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
                    color: kLightText(themeController, kBigText).color,
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
                    style: kLightText(themeController, kBigText),
                  ),
                  Text(
                    'Manga',
                    style: kLightText(themeController, kBigText),
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
                children: [
                  DrawerHeader(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 50.w,
                          child: ClipOval(
                            child: userProfileImageUrl != null
                                ? Image.network(
                                    userProfileImageUrl!,
                                    fit: BoxFit.cover,
                                    width: 100.w,
                                    height: 100.h,
                                  )
                                : Image.asset(
                                    'assets/images/anime_icon.jpg',
                                    fit: BoxFit.cover,
                                    width: 100.w,
                                    height: 100.h,
                                  ),
                          ),
                        ),
                        SizedBox(width: 50.w),
                        Text(
                          userName,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: kBoldText(themeController, kBigText),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListTile(
                        title: Text(
                          '3'.tr,
                          style: kLightText(themeController, kBigText - 1),
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
                                '4'.tr,
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
                                '5'.tr,
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
