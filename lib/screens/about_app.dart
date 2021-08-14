import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/app_text.dart';
import 'package:b_store/widget/image_auth.dart';
import 'package:flutter/material.dart';
class AboutAPP extends StatefulWidget {
  const AboutAPP({Key? key}) : super(key: key);

  @override
  _AboutAPPState createState() => _AboutAPPState();
}

class _AboutAPPState extends State<AboutAPP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         ImageAuth(),
          SizedBox(height: SizeConfig.scaleHeight(30),),
          AppText(text: 'B Store', color:AppColors.app_text1, fontsize: SizeConfig.scaleTextFont(25)),
          SizedBox(height: SizeConfig.scaleHeight(15),),
          AppText(text: 'Basel Nassar', color:AppColors.app_text1, fontsize: SizeConfig.scaleTextFont(18)),
        ],
      ),
    );
  }
}
