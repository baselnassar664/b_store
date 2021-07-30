import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/helpers.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/App_Text_Filed.dart';
import 'package:b_store/widget/app_elevatedbutton.dart';
import 'package:b_store/widget/app_text.dart';
import 'package:b_store/widget/appar_text.dart';
import 'package:flutter/material.dart';
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen>  with Helpers{
  late TextEditingController newPasswordController;
  late  TextEditingController newPasswordConformationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newPasswordController=TextEditingController();
    newPasswordConformationController=TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    newPasswordController.dispose();
    newPasswordConformationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:  ApparText(
          text: 'Back',
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(
          top: SizeConfig.scaleHeight(35),
          left: SizeConfig.scaleWidth(45),
          right: SizeConfig.scaleWidth(45),

        ),
        children: [
          AppText(text: 'Reset \nyour password', color: AppColors.app_text1, fontsize: SizeConfig.scaleTextFont(25),fontWeight: FontWeight.w700,),
          SizedBox(height: SizeConfig.scaleHeight(90),),

          AppTextFiled(
             textEditingController: newPasswordController,
            hintText: 'New password ',prefixIcon: Icons.lock,),
          SizedBox(height: SizeConfig.scaleHeight(20),),
          AppTextFiled(
            textEditingController: newPasswordConformationController,
            hintText: 'New password conformation ',prefixIcon: Icons.lock,),
          SizedBox(height: SizeConfig.scaleHeight(40),),
          AppElevatedButton(text: 'Reset', onPressed:()async{
            await performeReset();
          })
        ],
      ),
    );
  }
  Future performeReset()async{
    if (checkData()){
      await confirmReset();
    }

  }
  bool checkData(){
    if(newPasswordController.text.isNotEmpty && newPasswordConformationController.text.isNotEmpty ){
      return true;
    }
    showSnackBar(context, message: 'Enter required data',error: true);
    return false;
  }
  Future confirmReset()async{
    await Navigator.pushReplacementNamed(context, '/sign_in_screen');
  }
}
