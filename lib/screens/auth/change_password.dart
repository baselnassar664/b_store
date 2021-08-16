import 'package:b_store/api/auth_api_controller.dart';
import 'package:b_store/utils/helpers.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/App_Text_Filed.dart';
import 'package:b_store/widget/app_elevatedbutton.dart';
import 'package:b_store/widget/image_auth.dart';
import 'package:flutter/material.dart';
class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> with Helpers{
  late TextEditingController oldController;
  late TextEditingController newPasswordConformationController;
  late TextEditingController newPasswordController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newPasswordController=TextEditingController();
    oldController=TextEditingController();
    newPasswordConformationController=TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    oldController.dispose();
    newPasswordConformationController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body: Padding(
        padding:  EdgeInsets.only(
            top: SizeConfig.scaleHeight(30),
            left: SizeConfig.scaleWidth(30),
            right: SizeConfig.scaleWidth(30)
        ),
        child: Column(
          children: [
            ImageAuth(),
            SizedBox(height: SizeConfig.scaleHeight(50),),
            AppTextFiled(
              onChanged: (String value){

              },
              textEditingController: oldController,
              hintText: 'old password',prefixIcon: Icons.person,),
            SizedBox(height: SizeConfig.scaleHeight(20),),
            AppTextFiled(
              onChanged: (String value){

              },
              textEditingController: newPasswordController,
              hintText: ' new password',prefixIcon: Icons.phone_android,keyboardType: TextInputType.number,),
            SizedBox(height: SizeConfig.scaleHeight(20),),
            AppTextFiled(
              onChanged: (String value){

              },
              textEditingController: newPasswordConformationController,
              hintText: ' new password confirmation',prefixIcon: Icons.lock,obscureText: true,),
            SizedBox(height: SizeConfig.scaleHeight(40),),
            AppElevatedButton(text: 'Change Password', onPressed: ()async{
              await performeChange();
            })
          ],
        ),
      ),
    );
  }

  Future performeChange()async{
   if(checkData()){
  bool change=   await AuthApiController().changePassword(context, current_password:oldController.text, new_password: newPasswordController.text, new_password_confirmation: newPasswordConformationController.text);
  if(change){
    showSnackBar(context, message: 'password change successfully');
  }
   }
  }
  bool checkData() {
    if (oldController.text.isNotEmpty &&
        newPasswordController.text.isNotEmpty && newPasswordConformationController.text.isNotEmpty ) {
      if(conformPassword()){
        return true;
      }
    showSnackBar(context, message: 'Password is not confirmed correctly!',error: true);
    }else{
      showSnackBar(context, message: 'Enter required data!',error: true);}

    return false;
  }
  bool conformPassword(){
    return newPasswordController.text==newPasswordConformationController.text;
  }
}
