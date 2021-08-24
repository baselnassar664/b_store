import 'package:b_store/get/cart_controller.dart';
import 'package:b_store/get/product_controller.dart';
import 'package:b_store/get/productdetails_controller.dart';
import 'package:b_store/models/cart_item.dart';
import 'package:b_store/models/product.dart';
import 'package:b_store/models/productdetails.dart';
import 'package:b_store/preferences/student_preferences.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/helpers.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/app_elevatedbutton.dart';
import 'package:b_store/widget/app_text.dart';
import 'package:b_store/widget/appar_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
class ProductDetailsScreen extends StatefulWidget {


final ProudctDetails proudct;
  ProductDetailsScreen({required this.proudct});



  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> with Helpers{
  ProudctGetController  controller=Get.put(ProudctGetController());

  void initState() {
    Future.delayed(Duration.zero, () async {
      await  controller
          .getproudctdetails(id: widget.proudct.id);
    });
    super.initState();
  }
   int cardIncrement=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: ApparText(
          text: 'Proudct details',
        ),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body: GetX<  ProudctGetController >(
        builder: ( ProudctGetController  controller) {
          return controller.loading.value
              ? Center(
            child: CircularProgressIndicator(),
          )
              :Stack(children: [

            CarouselSlider(

              options: CarouselOptions(
                height: SizeConfig.scaleHeight(400),
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration:
                Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                // enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items:  controller.proudctdetails.value!.images
                  .map((Images image) {
                return Builder(
                  builder: (BuildContext context) {
                    return CachedNetworkImage(
                      imageUrl: image.imageUrl,
                      fit: BoxFit.cover,
                      height: SizeConfig.scaleHeight(400),
                      width: double.infinity,
                      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    );
                  },
                );
              }).toList(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: SizeConfig.scaleHeight(410),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),

                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(
                    vertical: SizeConfig.scaleHeight(15),
                    horizontal:SizeConfig.scaleWidth(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          AppText(text: StudentPreferences().languageCode=='en'?  controller.proudctdetails.value!.nameEn:controller.proudctdetails.value!.nameAr,color: AppColors.app_text1,fontsize: SizeConfig.scaleTextFont(20),fontWeight: FontWeight.w700,),
                          Spacer(),
                          GestureDetector(
                            onTap: (){
                              controller.addFavoriteProducts(product: controller.proudctdetails.value!, context: context);
                            },
                            child: Container(
                              width: SizeConfig.scaleWidth(55),
                              height:SizeConfig.scaleHeight(55),
                              decoration: BoxDecoration(
                                  shape:BoxShape.circle,
                                  color: controller.proudctdetails.value!.isFavorite ?Colors.red:Colors.grey
                              ),
                              child: Icon(Icons.favorite,color: Colors.white,),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: SizeConfig.scaleHeight(8),),
                      AppText(text: 'Price:\$${controller.proudctdetails.value!.price}',color: AppColors.app_text3,fontsize: SizeConfig.scaleTextFont(20),),
                      SizedBox(height: SizeConfig.scaleHeight(8),),
                      AppText(text: 'Description:',fontsize: SizeConfig.scaleTextFont(17),color: AppColors.app_text1,fontWeight: FontWeight.w700,),
                      SizedBox(height: SizeConfig.scaleHeight(8),),
                      Expanded(child: AppText(text: StudentPreferences().languageCode=='en'?  controller.proudctdetails.value!.infoEn:controller.proudctdetails.value!.infoAr,color: AppColors.app_text1,fontsize: SizeConfig.scaleTextFont(14),)),
                      SizedBox(height: SizeConfig.scaleHeight(8),),
                      RatingBar.builder(
                        initialRating: double.parse(
                            ProudctGetController
                                .to.proudctdetails.value!.productRate
                                .toString()),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 35,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          ProudctGetController.to.rattingProduct(
                              product: ProudctGetController
                                  .to.proudctdetails.value!,
                              context: context,
                              rate: rating);
                        },
                      ),
                      Spacer(),
                      AppElevatedButton(text: 'Add to cart', onPressed: (){showCartDialog();})
                    ],
                  ),
                ),
              ),
            )
          ],);
        },
      ),
    );
  }
  showCartDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) =>
          StatefulBuilder(builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Container(
                // clipBehavior: Clip.antiAlias,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: AppColors.app_color,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                      ),
                      padding: EdgeInsets.all(15),
                      width: double.infinity,
                      child: AppText(
                        text: 'Add To Card',
                        color: Colors.white,
                        fontsize:SizeConfig.scaleTextFont(18),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: CachedNetworkImage(
                              imageUrl: controller.proudctdetails.value!.imageUrl,
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.app_color,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            clipBehavior: Clip.antiAlias,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  FloatingActionButton(
                                    backgroundColor: AppColors.app_color,
                                    mini: true,
                                    onPressed: () {
                                      setState(() {
                                        ++cardIncrement;
                                      });
                                    },
                                    child: Icon(
                                      Icons.add,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: AppText(
                                      text: cardIncrement.toString(), fontsize:SizeConfig.scaleTextFont(15),
                                      color: AppColors.app_text1,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  FloatingActionButton(
                                    backgroundColor: AppColors.app_color,
                                    mini: true,
                                    onPressed: () {
                                      setState(() {
                                        cardIncrement == 1 ? cardIncrement = 1 : --cardIncrement;
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              AppText(
                                  text:
                                  'Total Price: \$${controller.proudctdetails.value!.price * cardIncrement}',
                                color: AppColors.app_text3,
                                fontsize:SizeConfig.scaleTextFont(13),
                                fontWeight: FontWeight.bold,),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(15), vertical: SizeConfig.scaleHeight(10)),
                            child: AppElevatedButton(
                              onPressed: () async{
                                bool status = await CartGetxController.to.createCartItem(cartItem);
                                if(status){
                                 showSnackBar(context,message: 'Add Success');
                                  cardIncrement=1 ;
                                }else{
                                 showSnackBar(context, message: 'Add failed');
                                  cardIncrement =1;
                                }
                                Get.back();
                              },

                              text: 'Add',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: AppElevatedButton(
                              onPressed: () {
                                cardIncrement = 1;
                                Get.back();
                              },
                              text: 'Cancel',

                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  CartItem get cartItem {
    CartItem cartItem = CartItem();
    cartItem.imageUrl = widget.proudct.imageUrl;
    cartItem.productId =widget.proudct.id;
    cartItem.price =widget.proudct.price;
    cartItem.nameEn = widget.proudct.nameEn;
    cartItem.nameAr = widget.proudct.nameAr;
    cartItem.quantity = cardIncrement;
    return cartItem;
  }
}
