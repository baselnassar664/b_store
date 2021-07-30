import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/helpers.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/App_Text_Filed.dart';
import 'package:b_store/widget/app_elevatedbutton.dart';
import 'package:b_store/widget/app_text.dart';
import 'package:b_store/widget/image_auth.dart';
import 'package:flutter/material.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with Helpers{
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
        child: Column(
          children: [
            ImageAuth(),
            SizedBox(height: SizeConfig.scaleHeight(90),),
            AppTextFiled(
              onChanged: (String value){
                validateForm();
              },
              textEditingController: _nameController,
              hintText: 'Name',prefixIcon: Icons.person,),
            SizedBox(height: SizeConfig.scaleHeight(20),),
            AppTextFiled(
              onChanged: (String value){
                validateForm();
              },
              textEditingController: _mobileController,
              hintText: 'Mobile Number',prefixIcon: Icons.phone_android,keyboardType: TextInputType.number,),
            SizedBox(height: SizeConfig.scaleHeight(20),),
            AppTextFiled(
              onChanged: (String value){
                validateForm();
              },
              textEditingController: _passwordController,
              hintText: 'Password',prefixIcon: Icons.lock,obscureText: true,),
            SizedBox(height: SizeConfig.scaleHeight(20),),
            AppTextFiled(
                onChanged: (String value){
                  validateForm();
                },
              textEditingController: _cityController,
                hintText: 'City',prefixIcon: Icons.location_city),
            SizedBox(height: SizeConfig.scaleHeight(20),),
            AppTextFiled(
              onChanged: (String value){
                validateForm();
              },
              textEditingController: _genderController,
              hintText: 'Gender',prefixIcon:Icons.person,),
            SizedBox(height: SizeConfig.scaleHeight(40),),
            AppElevatedButton(text: 'Create an account', onPressed: () async{
            await peformeCreateAccount();
           setState(() {
             validateForm();
           });
            },
              color: _createdEnabled ?
              AppColors.app_color :Colors.grey,
            ),
            Spacer(),
            InkWell(
              onTap: (){Navigator.pushReplacementNamed(context, '/sign_in_screen');},
                child: AppText(text: 'Already have account?', color: AppColors.app_color, fontsize: SizeConfig.scaleTextFont(14),fontWeight: FontWeight.w600,textAlign: TextAlign.center,))
          ],
        ),
      ),
    );
  }
  bool checkData(){
    if (_nameController.text.isNotEmpty && _mobileController.text.isNotEmpty && _passwordController.text.isNotEmpty && _cityController.text.isNotEmpty  && _genderController.text.isNotEmpty){
      return true;
    }
    return false;
  }
 Future createAccount()async{
    await Navigator.pushNamed(context,  '/verify-account_screen');
 }
 Future peformeCreateAccount()async{
    if(checkData()){
      await createAccount();
    }
    showSnackBar(context, message: 'Enter all required data',error: true);
 }
  void validateForm() {
    updateEnableStatus(checkData());
  }

  void updateEnableStatus(bool status) {
    setState(() {
      _createdEnabled = status;
    });
  }
}
