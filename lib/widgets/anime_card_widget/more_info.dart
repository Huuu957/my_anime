import 'package:flutter/material.dart';
import 'package:my_anime_list/constants.dart';

Widget moreInfo(String label, String value, double spacing) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: kDefaultPadding + 3,
              color: Colors.white,
              fontFamily: kDefaultFont,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: spacing),
          Text(
            value,
            style: TextStyle(
              fontSize: kDefaultPadding + 3,
              color: Colors.white,
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
