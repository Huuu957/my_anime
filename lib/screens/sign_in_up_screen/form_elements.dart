import 'package:flutter/material.dart';
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
    String errorMessage) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return errorMessage;
      }
      return null;
    },
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: hintText,
      hintStyle: const TextStyle(
        fontFamily: kDefaultFont,
      ),
    ),
    style: const TextStyle(
      color: kDarkColor,
    ),
  );
}

TextFormField buildTextFormFieldNoAuth(String hintText) {
  return TextFormField(
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: hintText,
      hintStyle: const TextStyle(
        fontFamily: kDefaultFont,
      ),
    ),
    style: const TextStyle(
      color: kDarkColor,
    ),
  );
}
