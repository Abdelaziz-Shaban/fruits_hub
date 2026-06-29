import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/terms_and_conditions_widgets.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_botton.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/password_field.dart';
import 'have_an_account_widget.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String email = "", userName = "", password = "";
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),

        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 24),

              CustomTextFormField(
                onSaved: (value) {
                  userName = value!;
                },
                title: 'الاسم كامل',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),

              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                title: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),

              SizedBox(height: 16),

              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),

              SizedBox(height: 16),

              TermsAndConditionsWidgets(
                onChanged: (value) {
                  isTermsAccepted = value;
                },
              ),

              SizedBox(height: 33),

              CustomBotton(
                onPressed: () {
                  // 1. أول حاجة نتشيك عليها هي الشروط.. لو مش موافق مش هنعمل أي حاجة تانية

                  // 2. لو موافق على الشروط، يبدأ يعمل الفاليوم بتاع الخانات ويشغل الكوبيت بأمان
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermsAccepted) {
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            email,
                            password,
                            userName,
                          );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "يجب عليك الموافقة على الشروط والأحكام",
                            style: TextStyle(fontFamily: 'Cairo'),
                          ),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: "إنشاء حساب جديد",
              ),
              SizedBox(height: 26),

              Center(
                child: HaveAnAccountWidget(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
