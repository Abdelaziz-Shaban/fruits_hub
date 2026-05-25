import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return   Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("تمتلك حساب بالفعل ؟",style: AppTextStyles.semiBold16.copyWith(
              color: Color(0xff949D9E)
          )),
          Text(" "),
          InkWell(
            onTap: onPressed,
            child: Text(" تسجيل دخول",style: AppTextStyles.semiBold16.copyWith(
                color:AppColors.primaryColor
            )),
          ),

        ]

    );
  }
}
