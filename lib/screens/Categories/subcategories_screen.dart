import 'package:b_store/get/subcategory_controller.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/app_text.dart';
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

      ),
      body: GetX<SubCategoryController>(
        builder: (SubCategoryController controller) {
          return controller.subcategories.isEmpty
              ? Center(
            child: CircularProgressIndicator(),
          )
              : GridView.builder(
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2,
                  crossAxisSpacing: SizeConfig.scaleWidth(15),
                    mainAxisSpacing:SizeConfig.scaleHeight(24),
                childAspectRatio:SizeConfig.scaleWidth(15)/SizeConfig.scaleHeight(24),
              ),
              itemBuilder: (context,index){
                return Container(
                  width: SizeConfig.scaleWidth(155),
                  height: SizeConfig.scaleHeight(220),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: SizeConfig.scaleHeight(170),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),

                        ),
                        child: Stack(
                          children: [
                            Image.network(controller.subcategories[index].imageUrl,fit: BoxFit.cover,),
                            SizedBox(height: SizeConfig.scaleHeight(11)),
                            AppText(text: controller.subcategories[index].nameEn, color:AppColors.app_text1, fontsize: SizeConfig.scaleTextFont(15))
                           
                          ],
                        ),
                      )
                    ],
                  )
                );
              }
          );
        },
      ),
    );

  }
}
