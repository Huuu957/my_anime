import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../constants.dart';
import '../controller/favorite_controller.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FavoriteController favoriteController = Get.find();

    return Scaffold(
      backgroundColor: kPaleLavender,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: kPaleLavender,
        title: Text(
          'Favorites',
          style: boldTextStyle(kBigText + 2.5),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0.h),
          child: Container(
            color: Colors.black,
            height: 1.0.h,
          ),
        ),
      ),
      body: Obx(() {
        final favorites = favoriteController.favList;
        if (favorites.isEmpty) {
          return const Center(
            child: Text(
              'Your Favorites Collection is Empty',
              style: TextStyle(
                color: kSecondaryColor,
                fontFamily: kDefaultFont,
              ),
            ),
          );
        } else {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75.w,
            ),
            itemCount: favorites.length,
            itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () {
                favoriteController.goToAnimeDetails(favorites[index]);
              },
              child: Padding(
                padding: EdgeInsets.all(kDefaultPadding),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                        child: Image.network(favorites[index].image),
                      ),
                    ),
                    SizedBox(height: kDefaultPadding),
                    Text(
                      favorites[index].title,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: boldTextStyle(kSmallText + 2),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}
