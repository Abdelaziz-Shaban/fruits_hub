import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';
import '../utils/constants.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Expanded(
          child: Divider(
            color: Color(0xFFDDDFDF),
            thickness: 1,
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Text(
            'أو',
            style: AppTextStyles.semiBold16.copyWith(
              color: const Color(0xFF141F1F),
            ),
          ),
        ),

        const Expanded(
          child: Divider(
            color: Color(0xFFDDDFDF),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
