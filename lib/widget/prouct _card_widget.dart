import 'package:b_store/models/cart_item.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';


class ProductCartWidget extends StatelessWidget {
  final CartItem cartItem;
  final void Function() onTap;

  ProductCartWidget({required this.cartItem, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(15),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 3),
                blurRadius: 5,
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            children: [
              CachedNetworkImage(
                height: SizeConfig.scaleHeight(150),
                width: SizeConfig.scaleWidth(120),
                imageUrl: cartItem.imageUrl,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: AppColors.app_color,
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.fill,
              ),
              SizedBox(
                width:SizeConfig.scaleWidth(15),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: 'Price For 1 Pic : ${cartItem.price}',
                    fontsize: SizeConfig.scaleTextFont(15),
                    fontWeight: FontWeight.w500,
                    color: AppColors.app_text1,
                  ),
                  SizedBox(height:SizeConfig.scaleHeight(8),),
                  AppText(
                    text: 'Quantity: ${cartItem.quantity} pic',
                    fontsize: SizeConfig.scaleTextFont(15),
                    fontWeight: FontWeight.w500,
                    color: AppColors.app_text1,
                  ),
                  SizedBox(height:SizeConfig.scaleHeight(8),),
                 AppText(
                 text: 'Total Price: : ${cartItem.price * cartItem.quantity}',
    fontsize: SizeConfig.scaleTextFont(15),
                    fontWeight: FontWeight.w500,
                   color: AppColors.app_text1,
                  ),

                ],
              )
            ],
          ),
        ),
        PositionedDirectional(
          top:SizeConfig.scaleHeight(15),
          end: SizeConfig.scaleHeight(15),
          child: IconButton(
            onPressed: onTap,
            icon: Icon(
              Icons.delete,
              color: Colors.red.shade900,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}