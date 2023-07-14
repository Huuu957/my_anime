import 'package:get/get.dart';
import '../themes/my_app_theme.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(isDarkMode.value
        ? MyAppTheme.customDarkTheme
        : MyAppTheme.customLightTheme);
  }
}
