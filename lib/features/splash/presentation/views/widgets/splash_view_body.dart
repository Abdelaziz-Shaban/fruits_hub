import 'package:flutter/cupertino.dart';
import 'package:fruit_hub/core/app_route/app_routes_name.dart';
import 'package:fruit_hub/core/services/shared_preferences_singleton.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/constants.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executeNavigation(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Image.asset(AppAssets.splashPlan)],
        ),
        Image.asset(AppAssets.splashLogo),
        Image.asset(AppAssets.splashBottom, fit: BoxFit.cover),
      ],
    );
  }
}

void executeNavigation(BuildContext context) {
  bool isOnBoardingViewSeen = Prefs.getBool(kisOnBoardingViewSeen);

  Future.delayed(const Duration(seconds: 3), () {
    if (isOnBoardingViewSeen ) {
      Navigator.pushReplacementNamed(context, AppRoutesName.loginView);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutesName.onBoarding);
    }
  });
}