import 'package:get/get.dart';

class MyLocale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          '1': 'Browse Anime',
        },
        'de': {
          '1': 'Durchsuche Anime',
        },
      };
}
