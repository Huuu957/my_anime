import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_anime/screens/sign_in_up_screen/form_elements.dart';
import '../../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  static const forgotPasswordScreenRoute = '/forgotPasswordScreenRoute';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void _sendPasswordResetEmail() async {
    String email = emailController.text.trim();

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      Get.snackbar(
        "49".tr,
        "50 $email".tr,
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        "45".tr,
        "48".tr,
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPaleLavender,
      appBar: AppBar(
        backgroundColor: kPaleLavender,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: kDarkColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(kBorderRadius * 7),
              child: Image.asset(
                'assets/images/anime-girl-sad-sad.gif',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: kDefaultPadding + 5, bottom: kDefaultPadding / 2),
              child: Text(
                '29'.tr,
                style: TextStyle(
                  fontSize: kBigText + 5,
                  color: kDarkColor,
                  fontFamily: kDefaultFont,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: kDefaultPadding, bottom: kDefaultPadding + 2),
              child: Text(
                '39'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: kBigText,
                  color: kDarkColor,
                  fontFamily: kDefaultFont,
                ),
              ),
            ),
            SizedBox(height: kDefaultPadding * 4),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(kDefaultPadding),
                    decoration: BoxDecoration(
                      color: kShadeColor,
                      borderRadius: BorderRadius.circular(kBorderRadius),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(128, 132, 227, .3),
                          blurRadius: 20.0,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: buildTextFormField(
                      '35'.tr,
                      false,
                      emailController,
                      formKey,
                      '42'.tr,
                    ),
                  ),
                  SizedBox(height: kDefaultPadding * 2),
                  ElevatedButton(
                    onPressed: () => _sendPasswordResetEmail(),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(double.infinity, 42.h),
                      backgroundColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '40'.tr,
                        style: const TextStyle(
                          color: kLightColor,
                          fontFamily: kDefaultFont,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
