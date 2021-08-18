import 'package:b_store/get/favorite_controller.dart';
import 'package:b_store/get/product_controller.dart';
import 'package:b_store/utils/size_config.dart';
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
                  left: SizeConfig.scaleWidth(30),
                  right: SizeConfig.scaleWidth(30)
              ),
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(

                crossAxisCount:2,
                crossAxisSpacing: SizeConfig.scaleWidth(15),
                mainAxisSpacing:SizeConfig.scaleHeight(24),
                childAspectRatio:SizeConfig.scaleWidth(140)/SizeConfig.scaleHeight(300),
              ),
              itemCount: controller.favoriteProducts.length,
              itemBuilder: (context,index){
                return  GestureDetector(
                  onTap: (){

                  },
                  child: Container(

                    clipBehavior:Clip.antiAlias ,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    height: SizeConfig.scaleHeight(300),
                    width:  SizeConfig.scaleWidth(140),
                    child:Stack(
                        fit: StackFit .expand,
                        children: [
                          CachedNetworkImage(
                            imageUrl:controller.favoriteProducts[index].imageUrl,
                            fit: BoxFit.cover,
                            height: SizeConfig.scaleHeight(400),
                            width: double.infinity,
                            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          )


                        ]
                    ),
                  ),
                );
              }
          ): Center(child: Text('No Favourite',style: TextStyle(fontSize: SizeConfig.scaleTextFont(50)),));
        },
      ),
    );
  }
}
