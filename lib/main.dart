import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/navigation_bar_widget.dart';
import 'constants.dart';
import 'screens/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Anime List',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      initialRoute: '/splash', // Set the initial route to the splash screen
      getPages: [
        GetPage(
            name: '/splash',
            page: () => SplashScreen()), // Add the splash screen route
        GetPage(name: '/', page: () => const NavigationBarWidget()),
      ],
    );
  }
}
