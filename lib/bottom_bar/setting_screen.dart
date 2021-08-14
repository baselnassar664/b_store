import 'package:b_store/api/auth_api_controller.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/app_text.dart';
import 'package:b_store/widget/image_auth.dart';
import 'package:b_store/widget/row_setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
           buildGestureDetector(  text: 'Profile',
             icon: Icons.person,onTap: (){}),
           buildDivider(),
           buildGestureDetector(   text: 'Language',
               icon: Icons.language,onTap: (){}),
           buildDivider(),
           buildGestureDetector(   text: 'Edit mobile',
               icon: Icons.phone_android,onTap: (){}),
           buildDivider(),
           buildGestureDetector(    text: 'Change password',
               icon: Icons.lock,onTap: (){}),
          buildDivider(),
          buildGestureDetector( text: ' Addresses',
              icon: Icons.location_city_sharp,onTap: (){}),
          buildDivider(),
          buildGestureDetector(   text: ' Contact us',
              icon: Icons.contact_page,onTap: (){ Navigator.pushNamed(context, '/contactus');}),
          buildDivider(),
          buildGestureDetector(    text: ' About',
              icon: Icons.info,onTap: (){
               Navigator.pushNamed(context, '/about_app');
              }),
          buildDivider(),
          buildGestureDetector(     text: ' Logout',
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
      Navigator.pushReplacementNamed(context, '/sign_in_screen');
    }
  }
}
