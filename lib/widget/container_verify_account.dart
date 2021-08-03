import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:flutter/material.dart';
class ContainerVerifyAccount extends StatelessWidget {
final double end;
final FocusNode focusNode;
final void Function(String value)?  onChanged;
final TextEditingController controller;
final Color? color;


ContainerVerifyAccount({this.end=10,required this.focusNode, required this.onChanged,required this.controller, this.color,});

  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: EdgeInsetsDirectional.only(
          end: SizeConfig.scaleWidth(end),
        ),
        width: SizeConfig.scaleWidth(55),
        height: SizeConfig.scaleHeight(60),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.app_color,
            width: 1,
          ),
          color:Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller:controller ,
          maxLength: 1,
          focusNode:focusNode ,
          onChanged:onChanged ,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: TextStyle(
              color: AppColors.app_color,
              fontFamily: 'Poppins',
              fontSize: SizeConfig.scaleTextFont(25)
          ),
          decoration: InputDecoration(
           counterText: '',
            enabledBorder: InputBorder.none,
            focusedBorder:InputBorder.none,
            border: InputBorder.none,
          ),
        )
    );
  }
}
