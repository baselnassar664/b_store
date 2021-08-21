import 'package:b_store/utils/AppColors.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';
class titleWidget extends StatelessWidget {
  final String title;

  final Function() ontap;

  titleWidget({
    required this.title,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText(
          text: title,
          fontWeight: FontWeight.bold,
          fontsize: 17,
          letterSpacing: 1,
          color: AppColors.app_color,
        ),
        Spacer(),
        TextButton(
          onPressed: ontap ,
          child: AppText(
            text: 'See More',
            fontsize: 14,
            color: AppColors.app_text2,
            letterSpacing: 1,
          ),
        )
      ],
    );
  }
}
