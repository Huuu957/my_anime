import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../screens/more_media_screen/more_anime_screen.dart';
import '../screens/more_media_screen/more_movie_screen.dart';
import '../screens/watch_trailer_screen.dart';
import '../themes/my_app_theme.dart';
import 'controller/favorite_controller.dart';
import 'controller/theme_controller.dart';
import 'widgets/navigation_bar_widget.dart';
import 'screens/splash_screen.dart';

Future<Box> openHiveBox(String boxname) async {
  if (!Hive.isBoxOpen(boxname)) {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
  }
  return await Hive.openBox(boxname);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeController = Get.put(ThemeController(), permanent: true);
  final FavoriteController favoriteController =
      Get.put(FavoriteController(), permanent: true);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeController themeController =
      Get.put(ThemeController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'My Anime',
          theme: themeController.isDarkMode.value
              ? MyAppTheme.customDarkTheme
              : MyAppTheme.customLightTheme,
          initialRoute: SplashScreen.splashScreenRoute,
          getPages: [
            GetPage(
              name: SplashScreen.splashScreenRoute,
              page: () => const SplashScreen(),
            ),
            GetPage(
              name: NavigationBarWidget.homeRoute,
              page: () => const NavigationBarWidget(),
            ),
            GetPage(
              name: MoreAnimeScreen.moreAnimeScreenRoute,
              page: () => const MoreAnimeScreen(),
            ),
            GetPage(
              name: MoreMovieScreen.moreMovieScreen,
              page: () => const MoreMovieScreen(),
            ),
            GetPage(
              name: WatchTrailerScreen.watchMoreScreen,
              page: () => const WatchTrailerScreen(),
            ),
          ],
        );
      },
    );
  }
}
