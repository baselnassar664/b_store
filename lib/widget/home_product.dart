import 'package:b_store/models/productdetails.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';


class HomeProductWidget extends StatelessWidget {
  final ProudctDetails product;
  final void Function() onTap;

  HomeProductWidget({required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                height: 190,
                width: double.infinity,
                imageUrl: product.imageUrl,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(

                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: product.nameEn,
                          fontsize: SizeConfig.scaleTextFont(13),
                          color: AppColors.app_text1,
                        ),
                        product.offerPrice == null
                            ?  AppText(
                          text: '\$${product.price}',
                          fontsize: SizeConfig.scaleTextFont(13),
                          color: AppColors.app_text1,
                          fontWeight: FontWeight.bold,
                        )
                            : AppText(
                          text: '\$${product.price}',
                          fontsize: SizeConfig.scaleTextFont(13),
                          color: AppColors.app_text1,
                          fontWeight: FontWeight.bold,

                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    product.offerPrice != null
                        ? AppText(
                      text: 'Offer: ${product.offerPrice}\₪',
                      color: AppColors.app_text1,
                      fontsize: SizeConfig.scaleTextFont(13),
                      fontWeight: FontWeight.bold,

                    )
                        : Container(),
                    SizedBox(
                      height: 12,
                    ),
                    AppText(
                      text: '${product.quantity} product available',
                      fontsize: SizeConfig.scaleTextFont(13),
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(Icons.star,color: Colors.amber,size: 15,),
                        SizedBox(width: 5,),
                        AppText(
                          text: '(${product.overalRate})',
                          fontsize: SizeConfig.scaleTextFont(13),
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}