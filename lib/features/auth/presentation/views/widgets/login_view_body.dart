import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/app_assets.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/custom_botton.dart';
import 'package:fruit_hub/core/widgets/password_field.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/social_login_botton.dart';

import '../../../../../core/app_route/app_routes_name.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import 'dont_have_an_account_widget.dart';
import '../../../../../core/widgets/or_divider.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
late String email,password;

class _LoginViewBodyState extends State<LoginViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 24),

              CustomTextFormField(
                onSaved: (value){
                  email=value!;
                },
                title: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
              ),

              SizedBox(height: 16),

              PasswordField(
                onSaved: (value){
                  password=value!;
                },
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

              CustomBotton(
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      formKey.currentState!.save();

                      context.read<LoginCubit>().loginUser(email, password);

                    }else{
                      autovalidateMode=AutovalidateMode.always;
                      setState(() {

                      });
                    }
                  },
                  text: "تسجيل دخول"
              ),

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
      ),
    );
  }
}
