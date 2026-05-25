import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/app_route/app_routes_name.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/social_login_botton.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/terms_and_conditions_widgets.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_botton.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import 'dont_have_an_account_widget.dart';
import '../../../../../core/widgets/or_divider.dart';
import 'have_an_account_widget.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            SizedBox(height: 24),

            CustomTextFormField(
              title: 'الاسم كامل',
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),

            CustomTextFormField(
              title: 'البريد الإلكتروني',
              textInputType: TextInputType.emailAddress,
            ),

            SizedBox(height: 16),

            CustomTextFormField(
              title: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
              icon: Icon(Icons.visibility_off, color: Color(0xffC9CECF)),
            ),

            SizedBox(height: 16),

            TermsAndConditionsWidgets(),

            SizedBox(height: 33),

            CustomBotton(onPressed: () {}, text: "إنشاء حساب جديد"),

            SizedBox(height: 26),

            Center(child:  HaveAnAccountWidget(onPressed: () {
              Navigator.pop(context);

            },)),


          ],
        ),
      ),
    );
  }
}
