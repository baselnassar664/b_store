import 'package:b_store/api/auth_api_controller.dart';
import 'package:b_store/get/language.dart';
import 'package:b_store/get/language_getx_controller.dart';
import 'package:b_store/preferences/student_preferences.dart';
import 'package:b_store/screens/about_app.dart';
import 'package:b_store/screens/address/add_adress_screen.dart';
import 'package:b_store/screens/address/adress_screen.dart';
import 'package:b_store/screens/auth/change_password.dart';
import 'package:b_store/screens/auth/profile_screen.dart';
import 'package:b_store/screens/auth/sign_in_screen.dart';
import 'package:b_store/screens/contact_us.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/app_text.dart';
import 'package:b_store/widget/image_auth.dart';
import 'package:b_store/widget/row_setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {


  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.scaleHeight(30),
        left: SizeConfig.scaleHeight(30),
        right: SizeConfig.scaleHeight(30),
      ),
      child: Column(
        children: [
          ImageAuth(),

          SizedBox(height: SizeConfig.scaleHeight(70)),
           buildGestureDetector(  text: "profile".tr,
             icon: Icons.person,onTap: (){
                 Get.to(ProfileScreen());
               }),
           buildDivider(),
           buildGestureDetector(   text:  "language".tr,
               icon: Icons.language,onTap: (){
                 AppLocale.changeLang();
               }),
           buildDivider(),
           buildGestureDetector(    text: "change_password".tr,
               icon: Icons.lock,onTap: (){  Get.to(ChangePassword());}),
          buildDivider(),
          buildGestureDetector( text: "address".tr,
              icon: Icons.location_city_sharp,onTap: (){
            Get.to(AddressScreen());
              }),
          buildDivider(),
          buildGestureDetector( text: 'nofilcation'.tr,
              icon: Icons.notifications,onTap: (){
                Get.to(AddressScreen());
              }),
          buildDivider(),
          buildGestureDetector(   text: "contact_us".tr,
              icon: Icons.contact_page,onTap: (){  Get.to(ContactUs());}),
          buildDivider(),
          buildGestureDetector(    text: "about".tr,
              icon: Icons.info,onTap: (){
               Get.to(AboutAPP());
              }),
          buildDivider(),
          buildGestureDetector(     text: "logout".tr,
              icon: Icons.logout,onTap: (){
            _showDialog();
              }),
        ],
      ),
    );
  }

  Divider buildDivider() =>  Divider(height: SizeConfig.scaleHeight(30),color: Color(0xff707070),);

  GestureDetector buildGestureDetector({ void Function()? onTap,required IconData icon,required String text}) {
    return GestureDetector(
               onTap: onTap,
               child: Row(
                 children: [
                   Icon(icon,
                     color: AppColors.app_color,),
                   SizedBox(width: SizeConfig.scaleWidth(20),),
                   AppText(text:text, color: AppColors.app_text1, fontsize: SizeConfig.scaleTextFont(16)),
                   Spacer(),
                   Icon(Icons.arrow_forward_ios,size: 24, color: AppColors.app_color,),
                 ],
               ),
             );
  }

  void _showDialog() {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(

            title: AppText(text: "are you want to LogOut?",color: AppColors.app_text1,fontsize: SizeConfig.scaleTextFont(15),),
            titlePadding: EdgeInsets.only(
                top: SizeConfig.scaleHeight(20),
              left: SizeConfig.scaleWidth(20),
            ),
            actions: [
              TextButton(
                  onPressed: () async {
                    await logout();
                  },
                  child: Text("Yes",style: TextStyle(color: Colors.red),)),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("No")),
            ],
            shape: RoundedRectangleBorder(
                side:BorderSide(
                 color: Colors.red,
                 width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
            ),
          );
        });
  }

  Future logout() async {
    bool logout = await AuthApiController().logout(context);
    if (logout) {
     Get.off(SignInScreen());
    }
  }
}
