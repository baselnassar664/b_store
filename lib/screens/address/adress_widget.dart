

import 'package:b_store/get/adress_controller.dart';
import 'package:b_store/models/adress.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
class AddressWidget extends StatelessWidget {
  final AddressDetails address;

  AddressWidget({required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsetsDirectional.only(top:SizeConfig.scaleHeight(10)),
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
      height: SizeConfig.scaleHeight(70),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
              start:  SizeConfig.scaleHeight(8),
              end:SizeConfig.scaleWidth(8),
              top: SizeConfig.scaleWidth(8),
              bottom:  SizeConfig.scaleHeight(8),
            ),
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade100,
              radius: 30,
              child: Icon(
                Icons.location_on,
                color: Colors.red.shade900,
                size: 30
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: address.info,
                fontWeight: FontWeight.w500,
                fontsize: SizeConfig.scaleTextFont(13),
                color: AppColors.app_text1,
              ),
              SizedBox(height:  SizeConfig.scaleHeight(5),),
              AppText(
               text: address.contactNumber,
                fontWeight: FontWeight.w500,
                fontsize:  SizeConfig.scaleTextFont(12),
                color: AppColors.app_color,
              ),
            ],
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async => await performDialog(context),
          ),
          Container(
            alignment: AlignmentDirectional.center,
            color: AppColors.app_color,
            child: IconButton(
             onPressed: (){},
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> deleteAddressDialog({required BuildContext context}) async {
    bool status = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: AppText(
              text: 'Delete Address',
              textAlign: TextAlign.start,
              color: AppColors.app_text1,
              fontsize: SizeConfig.scaleTextFont(12),
            ),
            content: AppText(
              text: 'Are you sure you want to delete this Address?',
              textAlign: TextAlign.start, color: AppColors.app_text1,
              fontsize: SizeConfig.scaleTextFont(12),
            ),
            actions: [
              TextButton(
                onPressed: () => Get.back(result: false),
                child: Text("No")
              ),
              TextButton(
                onPressed: () => Get.back(result: true),
                child: Text("yes")
              ),
            ],
          );
        });
    return status;
  }

  Future<void> performDialog(BuildContext context) async {
    bool status = await deleteAddressDialog(context: context);
    if (status) {
      await AddressGetController.to
          .deleteAddress(context: context, addressId: address.id);
    }
  }

}