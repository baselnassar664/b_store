import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/app_elevatedbutton.dart';
import 'package:b_store/widget/app_text.dart';
import 'package:flutter/material.dart';
class BoardingScreen extends StatefulWidget {
  const BoardingScreen({Key? key}) : super(key: key);

  @override
  _BoardingScreenState createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset:false,
      body: Padding(
        padding: EdgeInsets.only(
          top: SizeConfig.scaleHeight(150),
          left: SizeConfig.scaleWidth(45),
          right: SizeConfig.scaleWidth(45),
          bottom: SizeConfig.scaleHeight(50),
        ),
        child: Column(

          children: [
            AppText(text: 'Simply', color: AppColors.app_text1, fontsize: SizeConfig.scaleTextFont(25),fontWeight: FontWeight.w700,textAlign: TextAlign.center,),
            SizedBox(height: SizeConfig.scaleHeight(10),),
            AppText(text: 'Select your photographer,\nthen go to session!', color: AppColors.app_text1.withOpacity(0.7), fontsize: SizeConfig.scaleTextFont(16),fontWeight: FontWeight.w500,textAlign: TextAlign.center,),
            Spacer(),
            Image.asset('images/boarding.png'),
            Spacer(),
            Row(
              children: [
               buildContainer(color: AppColors.app_color,text: 'Sign in',ontap: (){
                 Navigator.pushReplacementNamed(context,  '/sign_in_screen');
               }),
                Spacer(),
                buildContainer(color: Colors.white,text: 'Sign up',colorText:AppColors.app_color,ontap: (){
                  Navigator.pushReplacementNamed(context,  '/sign_up_screen');
                }),
              ],
            )
          ],
        ),
      ),
    );
  }

  GestureDetector buildContainer({required  color,required String text,colorText=Colors.white,required ontap}) {
    return GestureDetector(
      onTap:ontap,
      child: Container(
               width: SizeConfig.scaleWidth(135),
               height: SizeConfig.scaleHeight(50),
               alignment: Alignment.center,
               decoration: BoxDecoration(
                 color:  color,
                 borderRadius: BorderRadius.circular(20),
                 border: Border.all(
                   width: 2,
                   color: AppColors.app_color,
                 )
               ),
               child: Text(
                 text,
                 style: TextStyle(
                   color: colorText,
                   fontFamily: 'Poppins',
                   fontWeight: FontWeight.w600,
                   fontSize: SizeConfig.scaleTextFont(14)
                 ),
               ),
             ),
    );
  }
}
