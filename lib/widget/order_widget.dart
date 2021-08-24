import 'package:b_store/models/order.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_text.dart';


class OrderWidget extends StatelessWidget {
  final Order order;

  OrderWidget({required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsetsDirectional.only(top: SizeConfig.scaleHeight(10)),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withAlpha(25),
            offset: Offset(0, 0),
            blurRadius: 6,
            spreadRadius: 3,
          )
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      height: SizeConfig.scaleHeight(80),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: 'Order ID ${order.id}',
                fontWeight: FontWeight.w500,
                fontsize: SizeConfig.scaleTextFont(13),
                color: AppColors.app_color,
              ),
              SizedBox(height: SizeConfig.scaleHeight(5),),
              AppText(
                text: 'Total Price: ${order.total}',
                fontWeight: FontWeight.w500,
                fontsize: SizeConfig.scaleTextFont(13),
                color: AppColors.app_text3,
              ),
            ],
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: order.status == 'Waiting' || order.status == 'Rejected'? Colors.red : Colors.green),
            child: AppText(
              text: ' ${order.status}',
              fontWeight: FontWeight.w500,
              fontsize: SizeConfig.scaleTextFont(13),
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}