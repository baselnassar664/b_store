import 'package:b_store/api/categories_api_controller.dart';
import 'package:b_store/get/CategoryGetxController.dart';
import 'package:b_store/models/Categories.dart';
import 'package:b_store/models/ontap.dart';
import 'package:b_store/models/sub_categories.dart';
import 'package:b_store/preferences/student_preferences.dart';
import 'package:b_store/screens/Categories/subcategories_screen.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/appar_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  CategoryGetxController controller = Get.put(CategoryGetxController());




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       centerTitle: true,
        title: ApparText( text: 'Categories',),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: GetX<CategoryGetxController>(
        builder: (CategoryGetxController controller) {
          return controller.categories.isEmpty
              ? Center(
            child: CircularProgressIndicator(),
          )
              : ListView.builder(
            padding: EdgeInsets.only(
              top: SizeConfig.scaleHeight(30),
              left: SizeConfig.scaleWidth(30),
              right: SizeConfig.scaleWidth(30),
            ),
            itemCount:controller.categories.length,
            itemBuilder: (context,index){
              return Row(
                children: [
                  GestureDetector(
                         onTap:(){
                           Get.to(Get.to(SubCategoriesScreen(
                               id: controller.categories[index].id),),);
                         },
                    child: Container(

                      margin: EdgeInsets.only(
                          bottom: SizeConfig.scaleHeight(20)
                      ),
                      width: SizeConfig.scaleWidth(100),
                      height:SizeConfig.scaleHeight(100),

                      child:  CachedNetworkImage(
                        imageUrl:  controller.categories[index].imageUrl,
                        fit: BoxFit.cover,

                        width: double.infinity,
                        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),),
                  ),
                  SizedBox(width: SizeConfig.scaleWidth(20),),

                  Text(StudentPreferences().languageCode=='en'?  controller.categories [index].nameEn:controller.categories [index].nameAr),
                  Spacer(),
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,size: 20,))

                ],
              );
            },

          );
        },
      ),
    );
  }
}
