import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:flutter/material.dart';
class ImageAuth extends StatelessWidget {
  const ImageAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Center(
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: SizeConfig.scaleWidth(75),
        height: SizeConfig.scaleHeight(75),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xff000000).withOpacity(0.15),
                offset: Offset(5, 5),
                blurRadius: 15,
                spreadRadius:0,
              ),
            ],
            borderRadius: BorderRadius.circular(30)
        ),
        child: Center(child: Image.asset('images/Path.png')),
      ),

    );
  }
}
