import 'dart:ffi';

import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';
class RowSetting extends StatelessWidget {
final String text;
final IconData icon;
final Void Function()? onTap;

RowSetting({required this.text,required  this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: onTap,
    child: Row(
    children: [
    Icon(icon,
    color: AppColors.app_color,),
    SizedBox(width: SizeConfig.scaleWidth(20),),
    AppText(text:text, color: AppColors.app_text1, fontsize: SizeConfig.scaleTextFont(16)),
    Spacer(),
   Icon(Icons.arrow_forward_ios,size: 24, color: AppColors.app_color,),
],
),
);
  }
}

