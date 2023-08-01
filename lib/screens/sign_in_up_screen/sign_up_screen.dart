import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../auth.dart';
import '../../screens/sign_in_up_screen/sign_in_screen.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../constants.dart';
import 'form_elements.dart';

class SignUpScreen extends StatefulWidget {
  static const signUpScreenRoute = '/signUpScreenRoute';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  File? _image;

  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController userNameController = TextEditingController();

  Future<String?> _uploadImageToStorage(String userId) async {
    if (_image == null) return null;

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child(userId);

      await ref.putFile(_image!);

      final downloadUrl = await ref.getDownloadURL();

      if (kDebugMode) {
        print("Image uploaded. Download URL: $downloadUrl");
      }

      return downloadUrl;
    } catch (e) {
      if (kDebugMode) {
        print("Error uploading image: $e");
      }
      return null;
    }
  }

  handleSubmit() async {
    if (!formKey.currentState!.validate()) return;

    final userName = userNameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    // Validate email format
    if (!GetUtils.isEmail(email)) {
      Get.snackbar(
        "45".tr,
        "51".tr,
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar(
        "45".tr,
        "52".tr,
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      await Auth().registerWithEmailAndPassword(email, password);
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.updateDisplayName(userName);
        await _uploadImageToStorage(user.uid);
        Get.snackbar(
          "49".tr,
          "53".tr,
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        userNameController.clear();
        emailController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
        setState(() {
          _image = null;
        });
      }
      Get.toNamed(SignUpScreen.signUpScreenRoute);
    } catch (e) {
      // Handle Firebase exceptions for email already in use
      if (e is FirebaseAuthException && e.code == 'email-already-in-use') {
        Get.snackbar(
          "45".tr,
          "54".tr,
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        // Show a generic error message for other exceptions
        Get.snackbar(
          "45".tr,
          "55".tr,
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      }
    });
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
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 3),
              child: CircleAvatar(
                backgroundColor: kPrimaryColor,
                radius: 40.w,
                child: ClipOval(
                  child: _image != null
                      ? Image.file(
                          _image!,
                          fit: BoxFit.cover,
                          width: 90.w,
                          height: 90.h,
                        )
                      : InkWell(
                          onTap: _pickImage,
                          child: Icon(
                            Icons.add_a_photo,
                            size: 40.w,
                            color: kLightColor,
                          ),
                        ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: kDefaultPadding * 2,
              ),
              child: Text(
                '33'.tr,
                style: TextStyle(
                  color: kDarkColor,
                  fontSize: kBigText + 4,
                  fontFamily: kDefaultFont,
                  fontWeight: FontWeight.bold,
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
                          buildTextFormField(
                            '47'.tr,
                            false,
                            userNameController,
                            formKey,
                            '56'.tr,
                            isUserNameField: true,
                          ),
                          buildDivider(),
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
                          buildDivider(),
                          buildTextFormField(
                            '57'.tr,
                            true,
                            confirmPasswordController,
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
                        '32'.tr,
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
                      Expanded(
                        child: buildDivider(),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        child: Text(
                          '27'.tr,
                          style: const TextStyle(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
