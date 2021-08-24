import 'package:b_store/get/adress_controller.dart';
import 'package:b_store/models/adress.dart';
import 'package:b_store/screens/address/edit_adress_screen.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'app_text.dart';
class AddressWidget extends StatelessWidget {
  final AddressDetails address;
  final void Function() onTap;
  AddressWidget({required this.address,required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        clipBehavior: Clip.antiAlias,

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
                  start:SizeConfig.scaleWidth(8),
                  end: SizeConfig.scaleWidth(8),
                  top: SizeConfig.scaleHeight(8),
                  bottom: SizeConfig.scaleHeight(8)
              ),
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade100,
                radius: 30,
                child: Icon(
                  Icons.location_on,
                  color: Colors.red.shade900,
                  size: 30,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  color: AppColors.app_text1,
                  text:  address.info,
                  fontWeight: FontWeight.w500,
                  fontsize: SizeConfig.scaleTextFont(13),
                ),
                SizedBox(height: SizeConfig.scaleHeight(5)),
                AppText(
                  text: address.contactNumber,
                  fontWeight: FontWeight.w500,
                  fontsize: SizeConfig.scaleTextFont(13),
                  color: AppColors.app_text1,
                ),
              ],
            ),
            Spacer(),
            IconButton(
                icon: Icon(Icons.delete,color: Colors.red,),
                onPressed: () async{
                    await AddressGetController.to
                       .deleteAddress(context: context, addressId: address.id);
                }
            ),
            Container(
              alignment: AlignmentDirectional.center,
              color: AppColors.app_color,
              child: IconButton(
                onPressed: () => Get.to(EditAddressScreen(address: address)),
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
