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
  // Define the emailController and formKey as instance variables
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void _sendPasswordResetEmail() async {
    // Get the email or phone number entered by the user
    String email = emailController.text.trim();

    try {
      // Send the password reset email
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      Get.snackbar(
        "Success",
        "A password reset email has been sent to $email",
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      // Handle any errors that occur during the password reset process
      Get.snackbar(
        "Error",
        "An error occurred. Please check your email and try again.",
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
                'Forgot Your \n Password?',
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
                'We will send a code to your email \n so we can confirm it\'s you',
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
                      'Enter Your Email',
                      false,
                      emailController,
                      formKey,
                      'Please enter your email',
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
                    child: const Center(
                      child: Text(
                        'Send',
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
