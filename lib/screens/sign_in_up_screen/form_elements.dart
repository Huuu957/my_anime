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
    String errorMessage,
    {bool isUserNameField = false,
    bool isImageField = false} // Add an optional parameter for image field
    ) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return errorMessage;
      }
      // Custom validation for the image URL field
      if (isImageField && !isImageUrlValid(value)) {
        return 'Please enter a valid image URL.';
      }
      // For the User Name field, you can add a custom validation
      if (isUserNameField && value.length < 3) {
        return 'User Name must be at least 3 characters long.';
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

bool isImageUrlValid(String url) {
  // Implement your custom validation for the image URL here
  // You can use regular expressions or other methods to validate the URL.
  // For this example, we'll assume any non-empty URL is valid.
  return url.isNotEmpty;
}
