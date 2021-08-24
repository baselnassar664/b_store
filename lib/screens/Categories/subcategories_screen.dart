import 'package:b_store/get/subcategory_controller.dart';
import 'package:b_store/preferences/student_preferences.dart';
import 'package:b_store/screens/Categories/product_screen.dart';

import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/app_text.dart';
import 'package:b_store/widget/appar_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SubCategoriesScreen extends StatefulWidget {
 final int id;


 SubCategoriesScreen( {required this.id});

  @override
  _SubCategoriesScreenState createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  SubCategoryController controller = Get.put(SubCategoryController());
  void initState() {
    Future.delayed(Duration.zero, () async {
      await controller.getSubCategory(id: widget.id);
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ApparText(
          text: 'Subcategories',
        ),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body: GetX<SubCategoryController>(
        builder: (SubCategoryController controller) {
          return controller.subcategories.isEmpty
              ? Center(
            child: CircularProgressIndicator(),
          )
              : GridView.builder(
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
              itemCount: controller.subcategories.length,
              itemBuilder: (context,index){
                return  GestureDetector(
                  onTap: (){
                    Get.to(ProudctScreen(id:controller.subcategories[index].id));
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
                      imageUrl:  controller.subcategories[index].imageUrl,
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
                  child:  AppText(text: StudentPreferences().languageCode=='en'?  controller.subcategories [index].nameEn:controller.subcategories[index].nameAr,color: Colors.white,fontsize: SizeConfig.scaleTextFont(12),),
                  ),
                  ),
                    ]
                  ),
                  ),
                );
              }
          );
        },
      ),
    );

  }
}
