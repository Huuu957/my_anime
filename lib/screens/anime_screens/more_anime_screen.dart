import 'package:flutter/material.dart';
import 'package:my_anime_list/constants.dart';
import 'package:get/get.dart';

class MoreAnimeScreen extends StatelessWidget {
  const MoreAnimeScreen({Key? key}) : super(key: key);
  static const moreAnimeScreenRoute = '/moreAnimeScreenRoute';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kPaleLavender,
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: kPaleLavender,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: kSecondaryColor,
          onPressed: () => Get.back(),
        ),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.search,
              color: kSecondaryColor,
            ),
          ),
        ],
      ),
      body: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 250,
        ),
        itemCount: 21,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(
              vertical: kDefaultPadding + 5,
              horizontal: kDefaultPadding - 5,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kBorderRadius),
              child: Image.asset(
                'assets/images/idol.jpg',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
