
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/core/utils/constants.dart';

class SocialLoginBotton extends StatelessWidget {
  const SocialLoginBotton({super.key, required this.title, required this.image, required this.onPressed});
  final String title;
  final String image;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 54,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xffDDDFDF),
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Row(
            children: [
              SvgPicture.asset(image,width: 25,),
              Spacer(),
              Text(title,style: AppTextStyles.semiBold16.copyWith(
                color: Color(0xff0C0D0D)
              ),),
              Spacer(),
              const SizedBox(width: 25),

            ],
          ),
        ),
      ),
    );
  }
}
