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
  List<RowSetting> _row=[
    RowSetting(text: 'Profile',icon: Icons.person,),
    RowSetting(text: 'Language',icon: Icons.language,),
    RowSetting(text: 'Edit mobile',icon: Icons.phone_android,),
    RowSetting(text: 'Change password',icon: Icons.lock,),
    RowSetting(text: ' Addresses',icon: Icons.location_city_sharp,),
    RowSetting(text: ' Contact us',icon: Icons.contact_page,),
    RowSetting(text: ' About',icon: Icons.info,),
    RowSetting(text: ' Logout',icon: Icons.logout,onTap: (){},),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
        top: SizeConfig.scaleHeight(30),
      left: SizeConfig.scaleHeight(30),
        right: SizeConfig.scaleHeight(30),
      ),
      child: Column(
        children: [
          ImageAuth(),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context,index){
                return _row[index];
              },
              separatorBuilder: (context,index){
                return Divider(
                color: Color(0xff7B7C98),
                );
              },
              itemCount: _row.length,
            ),
          ),
        ],
      ),
    );
  }
  Future logout() async{
 bool logout=   await AuthApiController().logout(context);
 if(logout){
  Navigator.pushReplacementNamed(context,  '/sign_in_screen');
 }
  }
}
