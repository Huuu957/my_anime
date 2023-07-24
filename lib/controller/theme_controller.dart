import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../themes/my_app_theme.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;
  late Box themeBox;

  @override
  void onInit() {
    super.onInit();
    openThemeBox();
  }

  Future<void> openThemeBox() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    themeBox = await Hive.openBox('theme');

    bool? storedTheme = themeBox.get('isDarkMode');
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

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(isDarkMode.value
        ? MyAppTheme.customDarkTheme
        : MyAppTheme.customLightTheme);

    themeBox.put('isDarkMode', isDarkMode.value);
    if (kDebugMode) {
      print('Theme preference saved: ${isDarkMode.value}');
    }
  }
}
