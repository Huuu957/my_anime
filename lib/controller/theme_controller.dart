import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../themes/my_app_theme.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;
  Box? themeBox;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(isDarkMode.value
        ? MyAppTheme.customDarkTheme
        : MyAppTheme.customLightTheme);

    // Save the updated theme preference to the theme box
    themeBox?.put('isDarkMode', isDarkMode.value);
    if (kDebugMode) {
      print('Theme preference saved: ${isDarkMode.value}');
    }
  }

  @override
  void onInit() {
    super.onInit();
    themeBox = Hive.box('theme');
    bool? storedTheme = themeBox?.get('isDarkMode');
    if (storedTheme != null) {
      isDarkMode.value = storedTheme;
      Get.changeTheme(storedTheme
          ? MyAppTheme.customDarkTheme
          : MyAppTheme.customLightTheme);
      if (kDebugMode) {
        print('Theme preference retrieved: $storedTheme');
      }
    }
  }
}
