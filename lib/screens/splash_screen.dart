import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash'; // Route name for navigation

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add any initialization or delay logic here if needed
    navigateToHome(); // Example navigation after the splash screen
  }

  void navigateToHome() {
    // Example navigation to the home screen after a delay
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/', // Replace with your home screen route
        (route) => false, // Remove all routes below the home screen route
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white, // Adjust the background color if needed
      body: Center(
        child: Text('Hello Everyone'),
      ),
    );
  }
}
