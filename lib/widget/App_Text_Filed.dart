
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:flutter/material.dart';
class AppTextFiled extends StatelessWidget {
 final String hintText;
 final double left;
 final double top;
 final double bottom;
  final TextEditingController? textEditingController;
  final TextInputType keyboardType;
 final int? maxLength;

 final TextAlign textAlign;
 final bool obscureText;
 final void Function(String value)? onChanged;
 final IconData?  prefixIcon;
 AppTextFiled({ required this.hintText, this.left=10, this.top=17, this.bottom=16, this.keyboardType=TextInputType.text, this.maxLength, this.textAlign=TextAlign.start, this.textEditingController,this.onChanged, this.obscureText=false, this.prefixIcon });

 @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText:obscureText,
      maxLength:maxLength ,
      keyboardType: keyboardType ,
      controller:textEditingController ,
      textAlign: textAlign,
    maxLines:1,
    onChanged:onChanged ,
      decoration: InputDecoration(
        prefixIcon: Icon( prefixIcon),
        counterText: '',

        labelStyle: TextStyle(
          color: AppColors.app_text1,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: SizeConfig.scaleTextFont(12),
        ),
        contentPadding: EdgeInsets.only(
          left: SizeConfig.scaleWidth(left),
       top:  SizeConfig.scaleHeight(top),

          bottom: SizeConfig.scaleHeight(bottom),
        ),
          hintText: hintText,

          hintStyle: TextStyle(
            color: AppColors.app_text1.withOpacity(0.4),
            fontFamily: 'Poppins',

            fontSize: SizeConfig.scaleTextFont(12),
          ),
        enabledBorder:  OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Color(0xff000000).withOpacity(0.1),
          ),
         borderRadius: BorderRadius.circular(15),
        ),
focusedBorder: OutlineInputBorder(
  borderSide: BorderSide(
    width: 1,
    color: AppColors.app_color,
  ),
  borderRadius: BorderRadius.circular(15),
),
      ),
    );
  }
}
