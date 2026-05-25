import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/core/utils/constants.dart';

import '../../../../../core/app_route/app_routes_name.dart';

class PageViewItems extends StatelessWidget {
  final String image, backgroundImage;
  final String subTitle;
  final Widget title;
  final bool isVisible;

  const PageViewItems({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.subTitle,
    required this.title,
    required this.isVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .5,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),

              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Image.asset(
                  image,
                  height: MediaQuery.of(context).size.height * .28,
                  fit: BoxFit.contain,
                ),
              ),

              Visibility(
                visible: isVisible,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: InkWell(
                    onTap: () {

                      Prefs.setBool(kisOnBoardingViewSeen, true);
                      Navigator.pushReplacementNamed(context, AppRoutesName.loginView);
                    },
                    child: Text(
                      "تخطي",
                      style: AppTextStyles.regular13.copyWith(
                        color: Color(0xFF949494),
                      )
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 50),
        title,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 37, vertical: 10),
          child: Text(
              subTitle,
              style: AppTextStyles.semiBold13.copyWith(
                color: Color(0xff4E5556)
              ),
              textAlign: TextAlign.center),
        ),
      ],
    );
  }
}
