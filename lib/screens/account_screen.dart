import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mailer/mailer.dart';
import 'package:my_anime/constants.dart';
import 'package:my_anime/controller/feed_back_controller.dart';
import 'package:my_anime/controller/theme_controller.dart';
import 'package:get/get.dart';
import 'package:my_anime/screens/sign_in_up_screen/sign_in_screen.dart';
import '../../auth.dart';
import 'package:mailer/smtp_server.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key, required this.themeController})
      : super(key: key);
  final ThemeController themeController;

  @override
  AccountScreenState createState() => AccountScreenState();
}

class AccountScreenState extends State<AccountScreen> {
  String? userProfileImageUrl;

  @override
  void initState() {
    super.initState();
    loadUserProfileImageUrl();
  }

  Future<void> loadUserProfileImageUrl() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String? imageUrl = await Auth().getUserProfileImageUrl(user.uid);
        setState(() {
          userProfileImageUrl = imageUrl;
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error loading user profile image: $e");
      }
    }
  }

  Future<bool> sendFeedbackEmail(String feedbackText) async {
    final smtpServer = gmail('your_email@gmail.com', 'your_email_password');

    final message = Message()
      ..from = const Address('alimehsen57@gmail.com')
      ..recipients.add(
          'recipient_email@example.com') // I'm not writing my email address this is just an example it should work
      ..subject = 'Feedback from MyAnime App'
      ..text = feedbackText;

    try {
      final sendReport = await send(message, smtpServer);
      if (kDebugMode) {
        print('Message sent: ${sendReport.toString()}');
      }
      return true;
    } catch (e) {
      if (kDebugMode) {
        print('Error sending email: $e');
      }
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final FeedbackController feedbackController = Get.find();
    return Scaffold(
      backgroundColor:
          themeController.isDarkMode.value ? kDarkColor : kPaleLavender,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor:
            themeController.isDarkMode.value ? kDarkColor : kPaleLavender,
        title: Text(
          '8'.tr,
          style: kBoldText(themeController, kBigText + 2.5),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0.h),
          child: Container(
            color: themeController.isDarkMode.value ? kLightColor : kDarkColor,
            height: 1.0.h,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(kDefaultPadding * 2),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
                  child: CircleAvatar(
                    radius: 50.w,
                    child: ClipOval(
                      child: userProfileImageUrl != null
                          ? Image.network(
                              userProfileImageUrl!,
                              fit: BoxFit.cover,
                              width: 100.w,
                              height: 100.h,
                            )
                          : Image.asset(
                              'assets/images/anime_icon.jpg',
                              fit: BoxFit.cover,
                              width: 100.w,
                              height: 100.h,
                            ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
                  child: TextFormField(
                    style: kBoldText(themeController, kSmallText),
                    onChanged: (value) {
                      if (value.length > 200) {
                        value = value.substring(0, 200);
                      }
                      feedbackController.updateFeedbackText(value);
                    },
                    maxLength: 200,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: '11'.tr,
                      hintStyle: kLightText(themeController, kSmallText),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),
                      counter: const SizedBox
                          .shrink(), // Hide the built-in character counter
                      suffix: Obx(
                        () => Text(
                          '${feedbackController.feedbackText.value.length}/200',
                          style: kBoldText(themeController, kSmallText),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: () async {
                      String feedbackText =
                          feedbackController.feedbackText.value.trim();
                      if (feedbackText.isNotEmpty) {
                        bool emailSent = await sendFeedbackEmail(feedbackText);
                        if (emailSent) {
                          Get.snackbar(
                            '49'.tr,
                            '58'.tr,
                            colorText: kLightColor,
                            backgroundColor: Colors.green,
                          );
                        } else {
                          Get.snackbar(
                            '49'.tr,
                            '58'.tr,
                            colorText: kLightColor,
                            backgroundColor: Colors.green,
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                    ),
                    child: Text('40'.tr),
                  ),
                ),
                SizedBox(height: 150.h),
                SizedBox(
                  width: 150.w,
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Get.offAllNamed(SignInScreen.singInScreenRoute);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text(
                      '12'.tr,
                      style: const TextStyle(color: kLightColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
