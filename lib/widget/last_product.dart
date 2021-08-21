import 'package:b_store/models/home.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';
class latestProduct_card extends StatelessWidget {
  final Latest_products product;
  final void Function() onTap;

  latestProduct_card(
      {
        required this.product,
        required this.onTap
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: SizeConfig.scaleWidth(15)),
      child: Container(
        clipBehavior:Clip.antiAlias ,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            border: Border.all(color: AppColors.app_color)
        ),
        height: SizeConfig.scaleHeight(230),
        width:  SizeConfig.scaleWidth(180),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: onTap,
              child: Container(
                width: double.infinity,
                height: SizeConfig.scaleHeight( 150),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.app_color,
                ),
                child: Image.network(product.imageUrl,fit: BoxFit.cover,),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: AppText(
                text: product.nameEn,
                  color: AppColors.app_text1, fontsize: SizeConfig.scaleTextFont(13)
              ),
            ),SizedBox(
              height: 8,
            ),
            Center(child: AppText(text: "Price:\$${product.price}", color: AppColors.app_text3, fontsize: SizeConfig.scaleTextFont(17),fontWeight: FontWeight.w700)),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
