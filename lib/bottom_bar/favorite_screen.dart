import 'package:b_store/get/favorite_controller.dart';
import 'package:b_store/get/product_controller.dart';
import 'package:b_store/preferences/student_preferences.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/app_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class favoriteScreen extends StatefulWidget {
  const favoriteScreen({Key? key}) : super(key: key);

  @override
  _favoriteScreenState createState() => _favoriteScreenState();
}

class _favoriteScreenState extends State<favoriteScreen> {
  ProudctGetController controller=Get.put(ProudctGetController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<  ProudctGetController >(
        builder: ( ProudctGetController  controller) {
          return controller.loading.value
              ? Center(
            child: CircularProgressIndicator(),
          )
              :  controller.favoriteProducts.isNotEmpty?
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
              itemCount: controller.favoriteProducts.length,
              itemBuilder: (context,index){
                return  Container(

                    clipBehavior:Clip.antiAlias ,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        border: Border.all(color: AppColors.app_color)
                    ),
                    height: SizeConfig.scaleHeight(300),
                    width:  SizeConfig.scaleWidth(146),
                    child:Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: SizeConfig.scaleHeight( 190),
                          child:CachedNetworkImage(
                            imageUrl:controller.favoriteProducts[index].imageUrl,
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
                        AppText(text: StudentPreferences().languageCode=='en'?  controller.favoriteProducts[index].nameEn:controller.favoriteProducts[index].nameAr, color: AppColors.app_text1, fontsize: SizeConfig.scaleTextFont(13)),
                        SizedBox(
                          height: 12,
                        ),
                        AppText(text: "\$${controller.favoriteProducts[index].price}", color: AppColors.app_text3, fontsize: SizeConfig.scaleTextFont(17),fontWeight: FontWeight.w700),
                        SizedBox(
                          height: 12,
                        ),

                      ],
                    )
                );
              }
          ): Center(child: Text('No Favourite ',style: TextStyle(fontSize: SizeConfig.scaleTextFont(30)),));
        },
      ),
    );
  }
}
