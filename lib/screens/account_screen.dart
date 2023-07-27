import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_anime/constants.dart';
import 'package:my_anime/controller/theme_controller.dart';
import 'package:get/get.dart';
import 'package:my_anime/screens/sign_in_up_screen/sign_in_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key, required this.themeController})
      : super(key: key);
  final ThemeController themeController;

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
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Get.offAllNamed(SignInScreen.singInScreenRoute);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          child: const Text(
            'Sign Out',
            style: TextStyle(color: kLightColor),
          ),
        ),
      ),
    );
  }
}
