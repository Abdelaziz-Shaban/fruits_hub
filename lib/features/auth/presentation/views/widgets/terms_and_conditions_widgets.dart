import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/constants.dart';

import '../../../../../core/utils/app_text_styles.dart';

class TermsAndConditionsWidgets extends StatefulWidget {
  const TermsAndConditionsWidgets({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<TermsAndConditionsWidgets> createState() =>
      _TermsAndConditionsWidgetsState();
}

class _TermsAndConditionsWidgetsState extends State<TermsAndConditionsWidgets> {
  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(14, 0),
      child: Row(
        children: [
          Checkbox(
            value: isAccepted,
            onChanged: (value) {
              isAccepted = value ?? false;
              widget.onChanged(value!);
              setState(() {


              });
            },
            side: const BorderSide(color: Color(0xffDDDFDF), width: 1.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                6,
              ), // الكيرف الخفيف اللي في الصورة
            ),
            activeColor:
                AppColors.primaryColor, // اللون الأخضر بتاع الأبلكيشن عند ال
          ),

          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                    style: AppTextStyles.semiBold13.copyWith(
                      color: const Color(0xff949D9E),
                    ),
                  ),
                  TextSpan(
                    children: [
                      TextSpan(text: ' '),

                      TextSpan(
                        text: 'الشروط والأحكام الخاصة بنا',
                        style: AppTextStyles.semiBold13.copyWith(
                          color: AppColors.lightPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
