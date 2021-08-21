
import 'package:b_store/api/auth_api_controller.dart';
import 'package:b_store/get/cities_controller.dart';
import 'package:b_store/models/cities.dart';
import 'package:b_store/preferences/student_preferences.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/helpers.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/App_Text_Filed.dart';
import 'package:b_store/widget/app_elevatedbutton.dart';
import 'package:b_store/widget/app_text.dart';
import 'package:get/get.dart';
import 'package:b_store/widget/image_auth.dart';
import 'package:flutter/material.dart';


import 'citis_screen.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with Helpers{
  CitiesGetxController controller=Get.put(CitiesGetxController());

  Cities? city;

  bool isMale = StudentPreferences().student.gender == 'M'? true: false;
  late TextEditingController _nameController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController=TextEditingController(text: StudentPreferences().student.name);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body: Padding(
        padding:  EdgeInsets.only(    top: SizeConfig.scaleHeight(30),
            left: SizeConfig.scaleWidth(30),
            right: SizeConfig.scaleWidth(30)),
        child: Column(
          children: [
            ImageAuth(),
            SizedBox(height: SizeConfig.scaleHeight(50),),
            AppTextFiled(
              textEditingController: _nameController,
              hintText: 'Name',prefixIcon: Icons.person,),
            SizedBox(height: SizeConfig.scaleHeight(20),),
            GestureDetector(
              onTap: () async {
                Cities selectedCity = await Get.to(CitiesScreen());
                setState(() {
                  city = selectedCity;
                });
              },
              child: Container(
                padding: EdgeInsetsDirectional.only(start: SizeConfig.scaleWidth(33), end: SizeConfig.scaleWidth(10)),
                alignment: AlignmentDirectional.centerStart,
                height:SizeConfig.scaleHeight(50),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF999999).withAlpha(25),
                        offset: Offset(0, 5),
                        blurRadius: 10,
                        spreadRadius: 0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.grey)),
                child:getCityName(),
              ),
            ),
            SizedBox(height: SizeConfig.scaleHeight(20),),
            Row(
              children: [
                Expanded(
                  child: CheckboxListTile(
                    checkColor: Colors.white,
                    activeColor: AppColors.app_color,
                    value: isMale,
                    onChanged: (var selected) {
                      setState(() {
                        isMale = true;
                      });
                    },
                    title: AppText(
                      text: 'Male',
                      fontsize: SizeConfig.scaleTextFont(16),
                      color: AppColors.app_text1,
                    ),
                  ),
                ),

                Expanded(
                  child: CheckboxListTile(
                    checkColor: Colors.white,
                    activeColor: AppColors.app_color,
                    value: !isMale,
                    onChanged: (var selected) {
                      setState(() {
                        isMale = false;
                      });
                    },
                    title: AppText(
                      text: 'Female',
                      fontsize: SizeConfig.scaleTextFont(16),
                      color: AppColors.app_text1,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.scaleHeight(40),),
            AppElevatedButton(text: 'Update profile', onPressed:()async{
              await peformeCreateAccount();
            })
          ],
        ),
      ),
    );
  }
  Widget getCityName() {
    if (city == null) {
      return AppText(
        text:'Gaza',
        color:AppColors.app_text2,
        fontsize: SizeConfig.scaleTextFont(15),
      );
    } else {
      if (StudentPreferences().languageCode == 'ar') {
        return AppText(
          text: city!.nameAr,
          color: AppColors.app_text1,
          fontsize: SizeConfig.scaleTextFont(15),
        );
      } else {
        return AppText(
          text: city!.nameEn,
          color: AppColors.app_text1,
          fontsize: SizeConfig.scaleTextFont(15),
        );
      }
    }
  }
  bool checkData(){
    if (_nameController.text.isNotEmpty  ){
      return true;
    }
    showSnackBar(context, message: 'Enter required data',error: true);
    return false;
  }
  Future updateProfile()async{
    await AuthApiController().updateProfile(context, name: _nameController.text, gender: isMale ? 'M' : 'F',city_id:city!.id);

  }
  Future peformeCreateAccount() async{
    if(checkData()){
      await updateProfile();
    }

  }
}
