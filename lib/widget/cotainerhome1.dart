import 'package:b_store/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';

class ContainerHome1 extends StatelessWidget {
 final String image;
 final double  right;
 final String title;
 ContainerHome1({required this.image, this.right=15, this.title=''});

  @override
  Widget build(BuildContext context) {
    return  Column(

      children: [
        Container(

          margin: EdgeInsets.only(
              right:right,
          ),
          clipBehavior:Clip.antiAlias ,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5)
          ),
          height: SizeConfig.scaleHeight(140),
          width:  SizeConfig.scaleWidth(140),
          child:Stack(
            fit: StackFit .expand,
            children: [
              Image.asset(image,fit: BoxFit.cover,),
              Center(
                child: Container(
                  color: Colors.black.withOpacity(0.7),

                  alignment: Alignment.center,
                  height: SizeConfig.scaleHeight(50),
                  child:  AppText(text: title,color: Colors.white,fontsize: SizeConfig.scaleTextFont(12),),
                ),
              )
            ],
          )
        ),

       
      ],
    );
  }
}
