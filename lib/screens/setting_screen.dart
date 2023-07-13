import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_anime_list/constants.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPaleLavender,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: kPaleLavender,
        title: Text(
          'Settings',
          style: myTextStyle(kBigText + 5),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0.h),
          child: Container(
            color: Colors.black,
            height: 1.0.h,
          ),
        ),
      ),
      body: const Center(
        child: Text('Setting'),
      ),
    );
  }
}
