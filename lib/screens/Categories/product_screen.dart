import 'package:b_store/get/product_controller.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/app_text.dart';
import 'package:b_store/widget/appar_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProudctScreen extends StatefulWidget {
  final int id;


  ProudctScreen({required this.id});

  @override
  _ProudctScreenState createState() => _ProudctScreenState();
}

class _ProudctScreenState extends State<ProudctScreen> {
  ProudctGetController controller=Get.put(ProudctGetController());
  void initState() {
    Future.delayed(Duration.zero, () async {
      await controller.getproduct(id: widget.id);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ApparText(
          text: 'Products',
        ),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body: GetX<ProudctGetController>(
        builder: (ProudctGetController controller) {
          return controller.proudct.isEmpty
              ? Center(
            child: CircularProgressIndicator(),
          )
              : GridView.builder(
              padding:  EdgeInsets.only(
                  top: SizeConfig.scaleHeight(30),
                  left: SizeConfig.scaleWidth(20),
                  right: SizeConfig.scaleWidth(20)
              ),
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(

                crossAxisCount:2,
                crossAxisSpacing: SizeConfig.scaleWidth(10),
                mainAxisSpacing:SizeConfig.scaleHeight(24),
                childAspectRatio:SizeConfig.scaleWidth(146)/SizeConfig.scaleHeight(300),
              ),
              itemCount: controller.proudct.length,
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
                        child: Image.network(
                          controller.proudct[index].imageUrl,fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),


                            AppText(text: controller.proudct[index].nameEn, color: AppColors.app_text1, fontsize: SizeConfig.scaleTextFont(13)),




                      SizedBox(
                        height: 12,
                      ),
                      AppText(text: "\$${controller.proudct[index].price}", color: AppColors.app_text3, fontsize: SizeConfig.scaleTextFont(14),fontWeight: FontWeight.w700),
                      SizedBox(
                        height: 12,
                      ),
                      AppText(text: "${controller.proudct[index].quantity} product available", color: AppColors.app_text2, fontsize: SizeConfig.scaleTextFont(13),textAlign: TextAlign.start,),
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
