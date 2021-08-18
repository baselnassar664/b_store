
import 'package:b_store/get/product_controller.dart';
import 'package:b_store/get/productdetails_controller.dart';
import 'package:b_store/models/productdetails.dart';
import 'package:b_store/preferences/student_preferences.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/app_elevatedbutton.dart';
import 'package:b_store/widget/app_text.dart';
import 'package:b_store/widget/appar_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProductDetailsScreen extends StatefulWidget {
  final int id;

  ProductDetailsScreen({required this.id});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ProudctGetController  controller=Get.put(ProudctGetController());

  void initState() {
    Future.delayed(Duration.zero, () async {
      await  controller
          .getproudctdetails(id: widget.id);
    });
    super.initState();
  }
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
                         Spacer(),
                         AppElevatedButton(text: 'Add to cart', onPressed: (){})
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
}
