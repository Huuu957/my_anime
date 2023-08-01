import 'package:get/get.dart';

class FeedbackController extends GetxController {
  final int maxLetterLimit = 200;
  final RxString feedbackText = ''.obs;

  void updateFeedbackText(String text) {
    if (text.length <= maxLetterLimit) {
      feedbackText.value = text;
    }
  }

  String get letterCount => '${feedbackText.value.length}/$maxLetterLimit';
}
