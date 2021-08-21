import 'package:b_store/get/card_controller.dart';
import 'package:b_store/preferences/student_preferences.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/app_elevatedbutton.dart';
import 'package:b_store/widget/app_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartGetxController controller=Get.put(CartGetxController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<  CartGetxController>(
        builder: ( CartGetxController  controller) {
          return controller.loading.value
              ? Center(
            child: CircularProgressIndicator(),
          )
              :  controller.cartItem.isNotEmpty?
          GridView.builder(
              padding:  EdgeInsets.only(
                  top: SizeConfig.scaleHeight(30),
                  left: SizeConfig.scaleWidth(20),
                  right: SizeConfig.scaleWidth(20)
              ),
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(

                crossAxisCount:2,
                crossAxisSpacing: SizeConfig.scaleWidth(10),
                mainAxisSpacing:SizeConfig.scaleHeight(24),
                childAspectRatio:SizeConfig.scaleWidth(146)/SizeConfig.scaleHeight(250),
              ),
              itemCount: controller.cartItem.length,
              itemBuilder: (context,index){
                return  Container(

                    clipBehavior:Clip.antiAlias ,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        border: Border.all(color: AppColors.app_color)
                    ),
                    height: SizeConfig.scaleHeight(350),
                    width:  SizeConfig.scaleWidth(146),
                    child:Column(
                      children: [
                        Container(
                            width: double.infinity,
                            height: SizeConfig.scaleHeight( 190),
                            child:CachedNetworkImage(
                              imageUrl:controller.cartItem[index].imageUrl,
                              fit: BoxFit.cover,
                              height: SizeConfig.scaleHeight(400),
                              width: double.infinity,
                              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            )
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AppText(text: StudentPreferences().languageCode=='en'?  controller.cartItem[index].nameEn:controller.cartItem[index].nameAr, color: AppColors.app_text1, fontsize: SizeConfig.scaleTextFont(13)),
                        SizedBox(
                          height: 12,
                        ),
                        AppText(text: "Price:\$${controller.cartItem[index].price}", color: AppColors.app_text3, fontsize: SizeConfig.scaleTextFont(17),fontWeight: FontWeight.w700),
                        SizedBox(
                          height: 12,
                        ),
                        AppText(text: "Quantity:\$${controller.cartItem[index].quantity}", color: AppColors.app_text3, fontsize: SizeConfig.scaleTextFont(17),fontWeight: FontWeight.w700),
                        SizedBox(
                          height: 12,
                        ),
                        AppText(text: "Total Price:\$${controller.cartItem[index].price *controller.cartItem[index].quantity}", color: AppColors.app_text3, fontsize: SizeConfig.scaleTextFont(17),fontWeight: FontWeight.w700),
                      ],
                    )
                );
              }
          ): Center(child: Text('No Cart ',style: TextStyle(fontSize: SizeConfig.scaleTextFont(50)),));
        },
      ),
    );
  }
}
