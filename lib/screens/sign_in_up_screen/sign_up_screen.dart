import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../auth.dart';
import '../../screens/sign_in_up_screen/sign_in_screen.dart';

import '../../constants.dart';
import 'form_elements.dart';

class SignUpScreen extends StatefulWidget {
  static const signUpScreenRoute = '/signUpScreenRoute';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  handleSubmit() async {
    if (!formKey.currentState!.validate()) return;

    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    // Validate email format
    if (!GetUtils.isEmail(email)) {
      Get.snackbar(
        "Error",
        "Please enter a valid email address.",
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // Check if password and confirm password match
    if (password != confirmPassword) {
      Get.snackbar(
        "Error",
        "Passwords do not match.",
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      await Auth().registerWithEmailAndPassword(email, password);
      Get.toNamed(SignUpScreen.signUpScreenRoute);
    } catch (e) {
      // Handle Firebase exceptions for email already in use
      if (e is FirebaseAuthException && e.code == 'email-already-in-use') {
        Get.snackbar(
          "Error",
          "This email is already registered. Please sign in instead.",
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        // Show a generic error message for other exceptions
        Get.snackbar(
          "Error",
          "An error occurred. Please try again later.",
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPaleLavender,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Create Account',
              style: TextStyle(
                color: kDarkColor,
                fontSize: kBigText + 5,
                fontFamily: kDefaultFont,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 3),
              child: CircleAvatar(
                radius: 50,
                child: Image.asset(
                  'assets/images/anime_icon.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: kDefaultPadding,
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
                          buildTextFormFieldNoAuth('User Name'),
                          buildDivider(),
                          buildTextFormField(
                            'Enter Your Email',
                            false,
                            emailController,
                            formKey,
                            'Please enter your email',
                          ),
                          buildDivider(),
                          buildTextFormField(
                            'Password',
                            true,
                            passwordController,
                            formKey,
                            'Please enter your email',
                          ),
                          buildDivider(),
                          buildTextFormField(
                            'Password Confirm',
                            true,
                            confirmPasswordController,
                            formKey,
                            'Please enter your password',
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
                    child: const Center(
                      child: Text(
                        'Sign up',
                        style: TextStyle(
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
                      Expanded(
                        child: buildDivider(),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'or',
                          style: TextStyle(
                            color: kGrey,
                            fontFamily: kDefaultFont,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: buildDivider(),
                      ),
                    ],
                  ),
                  SizedBox(height: kDefaultPadding),
                  ElevatedButton(
                    onPressed: () =>
                        Get.toNamed(SignInScreen.singInScreenRoute),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(double.infinity, 42.h),
                      backgroundColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Log in',
                        style: TextStyle(
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
