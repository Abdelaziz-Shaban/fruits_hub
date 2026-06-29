import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';

import 'custom_text_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

bool obscure = true;

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscure,
      onSaved: widget.onSaved,
      title: 'كلمة المرور',
      textInputType: TextInputType.visiblePassword,
      icon: GestureDetector(
        onTap: () {
          obscure = !obscure;
          setState(() {});
        },
        child: obscure
            ? Icon(Icons.visibility_outlined, color: Color(0xffC9CECF))
        : Icon(Icons.visibility_off, color: Color(0xffC9CECF))
      ),
    );
  }
}
