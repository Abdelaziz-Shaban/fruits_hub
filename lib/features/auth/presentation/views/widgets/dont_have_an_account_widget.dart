import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("لا تمتلك حساب ؟",style: AppTextStyles.semiBold16.copyWith(
            color: Color(0xff949D9E)
        )),
        Text(" "),
        InkWell(
          onTap: onPressed,
          child: Text("قم بإنشاء حساب",style: AppTextStyles.semiBold16.copyWith(
              color:AppColors.primaryColor
          )),
        ),

      ]

    );
  }
}
