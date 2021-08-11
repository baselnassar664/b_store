import 'package:b_store/api/auth_api_controller.dart';

import 'package:b_store/models/city.dart';
import 'package:b_store/screens/auth/verify-account_screen.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/helpers.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/App_Text_Filed.dart';
import 'package:b_store/widget/app_elevatedbutton.dart';
import 'package:b_store/widget/app_text.dart';
import 'package:b_store/widget/drop_down.dart';
import 'package:b_store/widget/image_auth.dart';
import 'package:flutter/material.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with Helpers{
  City dropcity= City.city[0];
  City dropgender= City.gender[0];
  int selectCity=0;
  int selectGender=0;
  late TextEditingController _nameController;
  late TextEditingController _mobileController;
  late TextEditingController _passwordController;
  late TextEditingController _cityController;
  late TextEditingController _genderController;
  bool _createdEnabled = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController=TextEditingController();
    _mobileController=TextEditingController();
    _passwordController=TextEditingController();
    _cityController=TextEditingController();
    _genderController=TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _mobileController.dispose();
    _passwordController.dispose();
    _cityController.dispose();
    _genderController.dispose();
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
          left: SizeConfig.scaleWidth(45),
          right: SizeConfig.scaleWidth(45),
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
                hintText: 'Mobile Number',prefixIcon: Icons.phone_android,keyboardType: TextInputType.number,),
              SizedBox(height: SizeConfig.scaleHeight(20),),
              AppTextFiled(
                onChanged: (String value){

                },
                textEditingController: _passwordController,
                hintText: 'Password',prefixIcon: Icons.lock,obscureText: true,),
              SizedBox(height: SizeConfig.scaleHeight(20),),
           Row(

             children: [
               DropDownn(list: City.city,onChanged: (City? city){
                 setState(() {
                   dropcity=city!;
                   selectCity=city.id;
                 });
               },value: dropcity,
                   hint:'city'
               ),
                Spacer(),
               DropDownn(list: City.gender,onChanged: (City? gender){
                 setState(() {
                   dropcity=gender!;
                   selectCity=gender.id;
                 });
               },value: dropgender,
                   hint:'gender'
               ),
             ],
           ),

              SizedBox(height: SizeConfig.scaleHeight(40),),
              AppElevatedButton(text: 'Create an account', onPressed: () async{
              await peformeCreateAccount();

              },

              ),
           
              InkWell(
                onTap: (){Navigator.pushReplacementNamed(context, '/sign_in_screen');},
                  child: AppText(text: 'Already have account?', color: AppColors.app_color, fontsize: SizeConfig.scaleTextFont(14),fontWeight: FontWeight.w600,textAlign: TextAlign.center,))
            ],
          ),
        ),
      ),
    );
  }
  bool checkData(){
    if (_nameController.text.isNotEmpty && _mobileController.text.isNotEmpty && _passwordController.text.isNotEmpty ){
      return true;
    }
    showSnackBar(context, message: 'Enter required data',error: true);
    return false;
  }
 Future createAccount()async{
   bool register=    await AuthApiController().Resgister(context, mobile: _mobileController.text, password:_passwordController.text, name:_nameController.text, STORE_API_KEY: '908e07a3-191e-4dba-8ebc-1001d13f0317', gender: City.gender[selectGender].nameEn,city_id: City.city[selectCity].id.toString());
   if(register){
     Navigator.pushReplacement(
         context,
         MaterialPageRoute(
             builder: (context) =>
                 VerifyAccountScreen(mobile: _mobileController.text)));
   }
 }
 Future peformeCreateAccount() async{
    if(checkData()){
      await createAccount();
    }

 }

}
