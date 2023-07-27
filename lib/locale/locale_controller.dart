import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class MyLocaleController extends GetxController {
  static const String _boxName = 'theme';
  Box? localBox;

  MyLocaleController() {
    openLocalBox();
  }

  @override
  void onInit() {
    super.onInit();
    openLocalBox();
  }

  Future<void> openLocalBox() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    localBox = await Hive.openBox(_boxName);

    String? storedLanguageCode = localBox?.get('language');
    if (storedLanguageCode != null) {
      changeLang(storedLanguageCode);
      if (kDebugMode) {
        print('Language preference retrieved: $storedLanguageCode');
      }
    } else {
      Locale? deviceLocale = const Locale('en');
      String defaultLanguageCode = deviceLocale.languageCode;
      changeLang(defaultLanguageCode);
    }
  }

  void changeLang(String codeLang) {
    Locale locale = Locale(codeLang);
    Get.updateLocale(locale);
    localBox?.put('language', codeLang);
  }

  Locale getCurrentLocale() {
    String? storedLanguageCode = localBox?.get('language');
    if (storedLanguageCode != null) {
      return Locale(storedLanguageCode);
    } else {
      Locale? deviceLocale = Get.deviceLocale;
      if (deviceLocale != null) {
        return deviceLocale;
      } else {
        return Get.deviceLocale ??
            const Locale('en'); // Fallback to English if deviceLocale is null
      }
    }
  }
}
