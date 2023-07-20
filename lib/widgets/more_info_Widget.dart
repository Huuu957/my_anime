import 'package:flutter/material.dart';
import '../constants.dart';

Widget moreInfoWidget(String label, String value, double spacing) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: kSmallText + 3,
              color: kLightColor,
              fontFamily: kDefaultFont,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: spacing),
          Text(
            value,
            style: TextStyle(
              fontSize: kSmallText + 3,
              color: kLightColor,
              fontFamily: kDefaultFont,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      SizedBox(height: kDefaultPadding),
    ],
  );
}
