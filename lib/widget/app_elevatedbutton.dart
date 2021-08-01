
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:flutter/material.dart';
class AppElevatedButton extends StatelessWidget {
  final String text;
  final Color color;
  final void Function() onPressed;
  final Color colortext;
  final double Width;
  AppElevatedButton({required this.text,required this.onPressed, this.color=AppColors.app_color, this.colortext=Colors.white, this.Width=double.infinity});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: onPressed,
      style:ElevatedButton.styleFrom(
          minimumSize: Size(Width,SizeConfig.scaleHeight(50)),
          primary: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)
        ),
          textStyle: TextStyle(
            fontSize:SizeConfig.scaleTextFont(14),
             color: colortext,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),

      ) ,
      child: Text(
        text,

      ),
    );
  }
}
