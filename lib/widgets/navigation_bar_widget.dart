import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../controller/theme_controller.dart';
import '../screens/account_screen.dart';
import '../screens/favorite_screen.dart';
import '../screens/home_screen.dart';
import 'package:get/get.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({Key? key}) : super(key: key);

  static const homeRoute = '/home';

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  int currentPageIndex = 0;
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => SizedBox(
          height: 60.h,
          child: BottomNavigationBar(
            backgroundColor:
                themeController.isDarkMode.value ? kDarkColor : kPaleLavender,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: kPrimaryColor,
            unselectedItemColor:
                themeController.isDarkMode.value ? kLightColor : kDarkColor,
            onTap: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            currentIndex: currentPageIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '', // Empty string to remove the label
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '',
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: currentPageIndex,
        children: <Widget>[
          HomeScreen(),
          FavoriteScreen(themeController: themeController),
          AccountScreen(themeController: themeController),
        ],
      ),
    );
  }
}
