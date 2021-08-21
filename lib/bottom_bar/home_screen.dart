import 'package:b_store/api/productdetails_api_controller.dart';
import 'package:b_store/get/CategoryGetxController.dart';
import 'package:b_store/get/home_controller.dart';
import 'package:b_store/get/product_controller.dart';
import 'package:b_store/preferences/student_preferences.dart';
import 'package:b_store/screens/Categories/Categories_screen.dart';
import 'package:b_store/screens/Categories/productdetails_screen.dart';
import 'package:b_store/screens/Categories/subcategories_screen.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/app_text.dart';
import 'package:b_store/widget/catgory_card.dart';
import 'package:b_store/widget/cotainerhome1.dart';
import 'package:b_store/widget/last_product.dart';
import 'package:b_store/widget/pageviewhome.dart';
import 'package:b_store/widget/titile_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class HomeScreen extends StatefulWidget {

  HomeGetxController controller = Get.put(HomeGetxController());

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryGetxController controller1 = Get.put(CategoryGetxController ());

  @override
  Widget build(BuildContext context) {


    return Scaffold(body: GetBuilder<HomeGetxController>(

      builder: (HomeGetxController home) {
        if (home.homeModel == null) {
          return Center(
            child: CircularProgressIndicator(

            ),
          );
        }
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding:
            EdgeInsets.only(top: SizeConfig.scaleHeight(30),
            left: SizeConfig.scaleWidth(30),
            right:SizeConfig.scaleWidth(30),
            bottom: SizeConfig.scaleHeight(30),)
            ,
            child:
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [

              Container(

                child: CarouselSlider(
                  options: CarouselOptions(
                    height: SizeConfig.scaleHeight(200),
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    initialPage: 2,
                    autoPlay: true,
                  ),
                  items: images(),
                ),
              ),
              SizedBox(height: SizeConfig.scaleHeight(8),),
              Row(
                children: [
                  AppText(text:'Categories', color: AppColors.app_text1, fontsize:SizeConfig.scaleTextFont(16),),
                  Spacer(),
                  TextButton(
                      onPressed: (){
                        Get.to(CategoriesScreen());
                      },
                      child: AppText(text:'see all', color: AppColors.app_text2, fontsize:SizeConfig.scaleTextFont(12),)),
                ],
              ),
              SizedBox(height: SizeConfig.scaleHeight(8),),

              home.homeModel == null
                  ? Container()
                  : SizedBox(
                height: SizeConfig.scaleHeight(100),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,

                  itemBuilder: (context, index) {
                    return  GestureDetector(
                      onTap: (){
                        Get.to(SubCategoriesScreen(id:controller1.categories[index] .id,));
                      },
                      child: Container(

                          margin: EdgeInsets.only(
                          right:SizeConfig.scaleWidth(15),
                      ),
                      clipBehavior:Clip.antiAlias ,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5)
                      ),
                      height: SizeConfig.scaleHeight(140),
                      width:  SizeConfig.scaleWidth(140),
                      child:Stack(
                      fit: StackFit .expand,
                      children: [
                        CachedNetworkImage(
                          imageUrl: controller1.categories[index] .imageUrl,
                          fit: BoxFit.cover,

                          width: double.infinity,
                          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      Center(
                      child: Container(
                      color: Colors.black.withOpacity(0.7),

                      alignment: Alignment.center,
                      height: SizeConfig.scaleHeight(50),
                      child:  AppText(text:controller1.categories [index].nameEn,color: Colors.white,fontsize: SizeConfig.scaleTextFont(12),),
                      ),
                      )
                 ]
                      )
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: SizeConfig.scaleHeight(15),),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(text:'Latest Products', color: AppColors.app_text1, fontsize:SizeConfig.scaleTextFont(16),textAlign: TextAlign.start,),
                ],
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(20),
              ),

              SizedBox(
                height: SizeConfig.scaleHeight(230),
                child: ListView.builder(


                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return latestProduct_card(
                        product: home.homeModel!.data.latestProducts[index],
                        onTap: () {

                        });
                  },
                ),
              ),


            ]),
          ),
        );
      },
    ));
  }

  List<Widget> images() {
    return widget.controller.homeModel!.data.slider
        .map((e) => Container(

      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: e.imageUrl,
                fit: BoxFit.fill,
                height: SizeConfig.scaleHeight(200),
                width: double.infinity,
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              )
            ],
          )),
    ))
        .toList();
  }

}
