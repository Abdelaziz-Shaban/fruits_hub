import 'package:flutter/material.dart';

class AppAssets {
  static const String appLogo = 'assets/images/app_logo.png';
  static const String onBoardingBG = 'assets/images/on_boarding_BG.svg';
  static const String onBoardingBG2 = 'assets/images/on_boarding_BG2.svg';
  static const String onBoardingPageViewImage1 =
      'assets/images/on_boarding_page_view_image_1.png';
  static const String onBoardingPageViewImage2 =
      'assets/images/on_boarding_page_view_image_2.png';
  static const String splashBottom = 'assets/images/splash_bottom.png';
  static const String splashLogo = 'assets/images/splash_logo.png';
  static const String splashPlan = 'assets/images/splash_plan.png';
  static const String googleIcon = 'assets/images/google_icon.svg';
  static const String facebookIcon = 'assets/images/facebook_icon.svg';
  static const String appleIcon = 'assets/images/apple_icon.svg';
}

Future<void> myPrecacheImage(BuildContext context) async {
  await Future.wait([]);
}
