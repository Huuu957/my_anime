import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';

Divider buildDivider() {
  return const Divider(
    color: kGrey,
    thickness: 1,
  );
}

TextFormField buildTextFormField(
    String hintText,
    bool obscureText,
    TextEditingController controller,
    GlobalKey<FormState> formKey,
    String errorMessage,
    {bool isUserNameField = false,
    bool isImageField = false}) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return errorMessage;
      }
      if (isImageField && !isImageUrlValid(value)) {
        return 'Please enter a valid image URL.';
      }
      if (isUserNameField && value.length < 3) {
        return '46'.tr;
      }
      return null;
    },
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: hintText,
      hintStyle: const TextStyle(
        color: kGrey,
        fontFamily: kDefaultFont,
      ),
    ),
    style: const TextStyle(
      color: kDarkColor,
    ),
  );
}

bool isImageUrlValid(String url) {
  return url.isNotEmpty;
}
