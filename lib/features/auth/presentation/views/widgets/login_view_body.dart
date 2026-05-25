import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_assets.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/custom_botton.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/social_login_botton.dart';

import '../../../../../core/app_route/app_routes_name.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import 'dont_have_an_account_widget.dart';
import '../../../../../core/widgets/or_divider.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            SizedBox(height: 24),

            CustomTextFormField(
              title: 'البريد الالكتروني',
              textInputType: TextInputType.emailAddress,
            ),

            SizedBox(height: 16),

            CustomTextFormField(
              title: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
              icon: Icon(Icons.visibility_off, color: Color(0xffC9CECF)),
            ),

            SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "نسيت كلمة المرور؟",
                  style: AppTextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),

            SizedBox(height: 33),

            CustomBotton(onPressed: () {}, text: "تسجيل دخول"),

            SizedBox(height: 33),

            Center(child:  DontHaveAnAccountWidget(onPressed: () {
              Navigator.pushNamed(context, AppRoutesName.signupView);

            },)),

            SizedBox(height: 33),

            OrDivider(),

            SizedBox(height: 16),

            SocialLoginBotton(
              title: 'تسجيل بواسطة جوجل',
              image: AppAssets.googleIcon,
              onPressed: () {},
            ),

            SizedBox(height: 16),

            SocialLoginBotton(
              title: 'تسجيل بواسطة أبل',
              image: AppAssets.appleIcon,
              onPressed: () {},
            ),

            SizedBox(height: 16),

            SocialLoginBotton(
              title: 'تسجيل بواسطة فيسبوك',
              image: AppAssets.facebookIcon,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
