import 'package:flutter/material.dart';
import 'widgets/navigation_bar_widget.dart';
import 'package:get/get.dart';
import 'constants.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Anime List',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => NavigationBarWidget()),
      ],
    );
  }
}
