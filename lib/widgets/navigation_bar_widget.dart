import 'package:flutter/material.dart';
import 'package:my_anime_list/constants.dart';
import 'package:my_anime_list/screens/setting_screen.dart';
import 'package:my_anime_list/screens/favorite_screen.dart';
import 'package:my_anime_list/screens/home_screen.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});

  static const homeRoute = '/home';

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 64,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kPrimaryColor,
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
              icon: Icon(Icons.settings),
              label: '',
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: currentPageIndex,
        children: <Widget>[
          HomeScreen(),
          const FavoriteScreen(),
          const SettingScreen(),
        ],
      ),
    );
  }
}
