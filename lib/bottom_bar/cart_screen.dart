import 'dart:convert';

import 'package:b_store/get/cart_controller.dart';
import 'package:b_store/models/cart_item.dart';
import 'package:b_store/preferences/student_preferences.dart';
import 'package:b_store/screens/Categories/shop_order.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/helpers.dart';
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

class _CartScreenState extends State<CartScreen> with Helpers {
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
            Padding(
              padding:  EdgeInsets.only(
                top: SizeConfig.scaleHeight(30),
                left: SizeConfig.scaleWidth(30),
                right: SizeConfig.scaleWidth(30),
                bottom: SizeConfig.scaleHeight(30),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(


                        itemCount: controller.cartItem.length,
                        itemBuilder: (context,index){
                          return  Container(
                              margin: EdgeInsets.only(
                                bottom: SizeConfig.scaleHeight(15),
                              ),
                              clipBehavior:Clip.antiAlias ,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  border: Border.all(color:AppColors.app_color)
                              ),
                              height: SizeConfig.scaleHeight(165),

                              child:Row(
                                children: [
                                  Container(

                                      width: SizeConfig.scaleWidth(150),
                                      height: double.infinity,
                                      child:CachedNetworkImage(
                                        imageUrl:controller.cartItem[index].imageUrl,
                                        fit: BoxFit.cover,

                                        width: double.infinity,
                                        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) => Icon(Icons.error),
                                      )
                                  ),
                                  SizedBox(width: SizeConfig.scaleWidth(10),),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      AppText(text: StudentPreferences().languageCode=='en'?  controller.cartItem[index].nameEn:controller.cartItem[index].nameAr, color: AppColors.app_text1, fontsize: SizeConfig.scaleTextFont(15),fontWeight: FontWeight.w700,),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      AppText(text: "Price:\$${controller.cartItem[index].price}", color: AppColors.app_text3, fontsize: SizeConfig.scaleTextFont(13),fontWeight: FontWeight.w700),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Center(child: AppText(text: "Quantity:${controller.cartItem[index].quantity}", color: AppColors.app_text3, fontsize: SizeConfig.scaleTextFont(13),fontWeight: FontWeight.w700,textAlign: TextAlign.center,),),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Center(child: AppText(text: "Total Price:\$${controller.cartItem[index].price *controller.cartItem[index].quantity}", color: AppColors.app_text3, fontsize: SizeConfig.scaleTextFont(13),fontWeight: FontWeight.w700,textAlign: TextAlign.center,)),
                                      IconButton(
                                        onPressed: ()async{
                                          await deleteItem(
                                            cartItem: controller.cartItem[index],
                                            context: context,
                                          );
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red.shade900,
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                          );
                        }
                    ),
                  ),

                  AppElevatedButton(

                    onPressed: (){
                      Get.to(shopOrder(cart: cart,));
                    }, text: 'Submit'
                    ,
                  )

                ],
              ),
            )
              : Center(child: Text('Add to Cart ',style: TextStyle(fontSize: SizeConfig.scaleTextFont(30)),));
        },
      ),
    );
  }
  deleteItem({required CartItem cartItem, required BuildContext context}) async {
    bool status = await CartGetxController.to.deleteItem(cartItem.id);
    String msg = status ? 'delete success' : 'delete fail';
    showSnackBar(context, message: msg);
  }

  String get cart {
    List<Map<String, dynamic>> items = [];
    CartGetxController.to.cartItem.map((element) => items.add({'product_id': element.productId, 'quantity': element.quantity})).toList();
    return jsonEncode(items);
  }

}
