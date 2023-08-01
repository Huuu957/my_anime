import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_anime/controller/theme_controller.dart';
import '../../auth.dart';
import '../../constants.dart';
import 'package:get/get.dart';
import 'form_elements.dart';
import 'forgot_password_screen.dart';
import 'sign_up_screen.dart';
import '../../widgets/navigation_bar_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const singInScreenRoute = '/singInScreenRoute';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  ThemeController themeController = Get.find();
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  handleSubmit() async {
    if (formKey.currentState == null) {
      if (kDebugMode) {
        print("Form state is null!");
      }
      return;
    }

    if (!formKey.currentState!.validate()) {
      if (kDebugMode) {
        print("Form validation failed!");
      }
      return;
    }

    final email = emailController.text;
    final password = passwordController.text;

    if (kDebugMode) {
      print("Email: $email");
    }
    if (kDebugMode) {
      print("Password: $password");
    }

    try {
      await Auth().signInWithEmailAndPassword(email, password);
      Get.toNamed(NavigationBarWidget.homeRoute);
    } catch (e) {
      Get.snackbar(
        "45".tr,
        "44".tr,
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPaleLavender,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 5),
                width: 100.w,
                height: 100.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(kButtonRadius),
                  child: Image.asset(
                    'assets/images/anime_icon.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                '41'.tr,
                style: TextStyle(
                  color: kDarkColor,
                  fontSize: kBigText + 2,
                  fontFamily: kDefaultFont,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: kDefaultPadding * 6,
                  right: kDefaultPadding,
                  left: kDefaultPadding,
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
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            buildTextFormField(
                              '35'.tr,
                              false,
                              emailController,
                              formKey,
                              '42'.tr,
                            ),
                            buildDivider(),
                            buildTextFormField(
                              '36'.tr,
                              true,
                              passwordController,
                              formKey,
                              '43'.tr,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: kDefaultPadding * 2),
                    ElevatedButton(
                      onPressed: () => handleSubmit(),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(double.infinity, 42.h),
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(kBorderRadius),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '26'.tr,
                          style: const TextStyle(
                            color: kLightColor,
                            fontFamily: kDefaultFont,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: kDefaultPadding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: Divider(
                            color: kGrey,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            '27'.tr,
                            style: const TextStyle(
                              color: kGrey,
                              fontFamily: kDefaultFont,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            color: kGrey,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: kDefaultPadding),
                    ElevatedButton(
                      onPressed: () =>
                          Get.offAllNamed(NavigationBarWidget.homeRoute),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(double.infinity, 42.h),
                        backgroundColor: kGrey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(kBorderRadius),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '28'.tr,
                          style: const TextStyle(
                            color: kLightColor,
                            fontFamily: kDefaultFont,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: kDefaultPadding * 2),
                    TextButton(
                      onPressed: () => Get.toNamed(
                          ForgotPasswordScreen.forgotPasswordScreenRoute),
                      child: Text(
                        '29'.tr,
                        style: const TextStyle(color: kPrimaryColor),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '30'.tr,
                          style: const TextStyle(color: kDarkColor),
                        ),
                        TextButton(
                          onPressed: () =>
                              Get.toNamed(SignUpScreen.signUpScreenRoute),
                          child: Text(
                            '32'.tr,
                            style: const TextStyle(color: kPrimaryColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
