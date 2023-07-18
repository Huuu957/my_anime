import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_anime/constants.dart';
import 'package:my_anime/controller/theme_controller.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Scaffold(
      backgroundColor:
          themeController.isDarkMode.value ? kDarkColor : kPaleLavender,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor:
            themeController.isDarkMode.value ? kDarkColor : kPaleLavender,
        title: Text(
          'Settings',
          style: kBoldThemeText(themeController, kBigText + 2.5),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0.h),
          child: Container(
            color: themeController.isDarkMode.value ? kLightColor : kDarkColor,
            height: 1.0.h,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'Setting',
          style: TextStyle(color: Colors.purple),
        ),
      ),
    );
  }
}
