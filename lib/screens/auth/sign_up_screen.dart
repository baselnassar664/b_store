import 'package:b_store/api/auth_api_controller.dart';
import 'package:b_store/models/cities.dart';

import 'package:b_store/preferences/student_preferences.dart';
import 'package:b_store/screens/auth/sign_in_screen.dart';
import 'package:b_store/screens/auth/verify-account_screen.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/helpers.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/App_Text_Filed.dart';
import 'package:b_store/widget/app_elevatedbutton.dart';
import 'package:b_store/widget/app_text.dart';

import 'package:b_store/widget/image_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

import 'citis_screen.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with Helpers{
  Cities? city;
bool isMale = true;
  late TextEditingController _nameController;
  late TextEditingController _mobileController;
  late TextEditingController _passwordController;

  bool _createdEnabled = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController=TextEditingController();
    _mobileController=TextEditingController();
    _passwordController=TextEditingController();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _mobileController.dispose();
    _passwordController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
          top: SizeConfig.scaleHeight(100),
          left: SizeConfig.scaleWidth(30),
          right: SizeConfig.scaleWidth(30),
          bottom: SizeConfig.scaleHeight(40),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImageAuth(),
              SizedBox(height: SizeConfig.scaleHeight(90),),
              AppTextFiled(
                onChanged: (String value){

                },
                textEditingController: _nameController,
                hintText: 'Name',prefixIcon: Icons.person,),
              SizedBox(height: SizeConfig.scaleHeight(20),),
              AppTextFiled(
                onChanged: (String value){

                },
                textEditingController: _mobileController,
                hintText: 'Mobile Number',prefixIcon: Icons.phone_android,keyboardType: TextInputType.number,maxLength: 9,),
              SizedBox(height: SizeConfig.scaleHeight(20),),
              AppTextFiled(
                onChanged: (String value){

                },
                textEditingController: _passwordController,
                hintText: 'Password',prefixIcon: Icons.lock,obscureText: true,),
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
                    child: Row(
                      children: [
                        getCityName(),
                        Spacer(),
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: AppColors.app_color,
                        )
                      ],
                    )),
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

                SizedBox(height: SizeConfig.scaleHeight(20),),
              AppElevatedButton(text: 'Create an account', onPressed: () async{
              await peformeCreateAccount();

              },

              ),
              SizedBox(height: SizeConfig.scaleHeight(40),),
              InkWell(
                onTap: (){Get.off(SignInScreen());},
                  child: AppText(text: 'Already have account?', color: AppColors.app_color, fontsize: SizeConfig.scaleTextFont(14),fontWeight: FontWeight.w600,textAlign: TextAlign.center,))
            ],
          ),
        ),
      ),
    );
  }
Widget getCityName() {
  if (city == null) {
    return AppText(
      text: 'Select City',
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
    if (_nameController.text.isNotEmpty && _mobileController.text.isNotEmpty && _passwordController.text.isNotEmpty && city!=null ){
      return true;
    }
    showSnackBar(context, message: 'Enter required data',error: true);
    return false;
  }
 Future createAccount()async{
   int? code =  await AuthApiController().Resgister(context, mobile: _mobileController.text, password:_passwordController.text, name:_nameController.text, STORE_API_KEY: '908e07a3-191e-4dba-8ebc-1001d13f0317', gender: isMale ? 'M' : 'F',city_id:city!.id);
   if(code!= null){
     showSnackBar(context, message: code.toString());
     Get.off(VerifyAccountScreen(mobile: _mobileController.text,));
   }

 }
 Future peformeCreateAccount() async{
    if(checkData()){
      await createAccount();
    }

 }

}
