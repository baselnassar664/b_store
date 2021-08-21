
import 'package:b_store/models/Categories.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';
class CategoryCard extends StatelessWidget {
  final Categories category;
  final void Function() onTap;

  // final double height;
  // final double width;

  CategoryCard({
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.scaleWidth(10),
          vertical: SizeConfig.scaleHeight(5)),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      width: SizeConfig.scaleWidth(1),
                      color: AppColors.app_color),
                  borderRadius: BorderRadius.all(
                      Radius.circular(SizeConfig.scaleHeight(50)))),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  category.imageUrl,
                ),

                radius: SizeConfig.scaleHeight(25),

                //child: Image.network(
                //  image,
                //  fit: BoxFit.contain,
                //  //width: double.infinity,
                //),
              ),
            ),
            SizedBox(
              height: SizeConfig.scaleTextFont(25),
            ),
            AppText(
              text:
                   category.nameAr
                  ,
              color: Colors.black,
              fontsize: SizeConfig.scaleTextFont(18),
              fontWeight: FontWeight.w400,
            )
          ],
        ),
      ),
    );
  }
}
