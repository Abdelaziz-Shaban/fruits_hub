
import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

AppBar BuildAppBar(context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(title, style: AppTextStyles.bold19),
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back_ios_rounded),
    ),
  );
}
