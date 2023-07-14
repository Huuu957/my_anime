import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../widgets/navigation_bar_widget.dart';

class SplashScreen extends StatefulWidget {
  static const String splashScreenRoute = '/splash';

  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 1), () {
      Get.offAllNamed(NavigationBarWidget.homeRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SpinKitPumpingHeart(
          color: Colors.red,
          size: 50.0.sp,
        ),
      ),
    );
  }
}
