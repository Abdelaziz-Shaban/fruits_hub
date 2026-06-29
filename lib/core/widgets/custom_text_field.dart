import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';

import '../utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
   const CustomTextFormField( {super.key, required this.title, required this.textInputType,  this.icon,this.onSaved,  this.obscureText=false});
final String title;
final TextInputType textInputType;
final Widget? icon;
final bool obscureText ;
final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,//دي عشان اخفي الي بيتكتب ف التيكست فيلد
      onSaved: onSaved,
      validator: (value){
        if(value==null || value.isEmpty){
          return "هذا الحقل مطلوب";
        }
        return null;
      },
      keyboardType: textInputType,
      textAlign: TextAlign.start,
      
      decoration: InputDecoration(
        suffixIcon:icon,
        filled: true,
        fillColor: Color(0xffF9FAFA),
        hintText: title,
        hintStyle: AppTextStyles.bold19.copyWith(
          color: Color(0xff949D9E)
        ),
        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Color(0xffE6E9EA))
        ),
        enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color:Color(0xffE6E9EA),width: 1)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Color(0xffE6E9EA),width: 2.5)
        )
        )
      

    );
  }
}
