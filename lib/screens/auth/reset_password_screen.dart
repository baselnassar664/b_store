import 'package:b_store/api/auth_api_controller.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/helpers.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/App_Text_Filed.dart';
import 'package:b_store/widget/app_elevatedbutton.dart';
import 'package:b_store/widget/app_text.dart';
import 'package:b_store/widget/appar_text.dart';
import 'package:b_store/widget/container_verify_account.dart';
import 'package:flutter/material.dart';
class ResetPasswordScreen extends StatefulWidget {
  final String mobile;

  ResetPasswordScreen({required this.mobile});

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen>  with Helpers{
  String _code = '';
  late TextEditingController newPasswordController;
  late  TextEditingController newPasswordConformationController;
  late TextEditingController  _firstController;
  late TextEditingController  _secondController;
  late TextEditingController  _thirdController;
  late TextEditingController  _fourthController;

  late FocusNode _firstFocousNode;
  late FocusNode _secondFocousNode;
  late FocusNode _thirdFocousNode;
  late FocusNode _fourthFocousNode;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newPasswordController=TextEditingController();
    newPasswordConformationController=TextEditingController();
    _firstController=TextEditingController();
    _secondController=TextEditingController();
    _thirdController=TextEditingController();
    _fourthController=TextEditingController();

    _firstFocousNode=FocusNode();
    _secondFocousNode=FocusNode();
    _thirdFocousNode=FocusNode();
    _fourthFocousNode=FocusNode();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _firstController.dispose();
    _secondController.dispose();
    _thirdController.dispose();
    _fourthController.dispose();

    _firstFocousNode.dispose();
    _secondFocousNode.dispose();
    _thirdFocousNode.dispose();
    _fourthFocousNode.dispose();
    newPasswordController.dispose();
    newPasswordConformationController.dispose();
    super.dispose();

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContainerVerifyAccount(

                controller: _firstController,
                focusNode: _firstFocousNode,
                onChanged: (String value){
                  if(value.isNotEmpty){
                    _secondFocousNode.requestFocus();
                  }
                },
              ),
              ContainerVerifyAccount(

                controller: _secondController,
                focusNode: _secondFocousNode,
                onChanged: (String value){
                  if(value.isNotEmpty){
                    _thirdFocousNode.requestFocus();
                  }
                  else{
                    _firstFocousNode.requestFocus();
                  }
                },
              ),
              ContainerVerifyAccount(

                controller: _thirdController,
                focusNode: _thirdFocousNode,
                onChanged: (String value){
                  if(value.isNotEmpty){
                    _fourthFocousNode.requestFocus();
                  }
                  else{
                    _secondFocousNode.requestFocus();
                  }
                },

              ),
              ContainerVerifyAccount(

                controller: _fourthController,
                focusNode: _fourthFocousNode,
                end: 0,
                onChanged: (String value){
                  if(value.isEmpty){
                    _thirdFocousNode.requestFocus();
                  }

                },
              ),
            ],
          ),
          SizedBox(height: SizeConfig.scaleHeight(40),),
          AppTextFiled(
             textEditingController: newPasswordController,
            hintText: 'New password ',prefixIcon: Icons.lock,),
          SizedBox(height: SizeConfig.scaleHeight(20),),
          AppTextFiled(
            textEditingController: newPasswordConformationController,
            hintText: 'New password conformation ',prefixIcon: Icons.lock,),
          SizedBox(height: SizeConfig.scaleHeight(40),),
          AppElevatedButton(text: 'Reset', onPressed:()async{
                  await performForgetPassword();
          })
        ],
      ),
    );
  }
  Future performForgetPassword() async {
    if (checkData()) {
      await forgetPassword();
    }
  }

  bool checkData() {
    if (isValidCode() && isPasswordSet) {
      if (isPasswordConfirmed) {
        return true;
      }

      showSnackBar(
         context,
          message: 'Password is not confirmed correctly!',
          error: true);
    } else {
      showSnackBar(
          context, message: 'Enter required data!', error: true);
    }
    return false;
  }

  bool get isPasswordSet {
    return newPasswordController.text.isNotEmpty &&
       newPasswordConformationController.text.isNotEmpty;
  }

  bool isValidCode() => code.isNotEmpty && _code.length == 4;

  bool get isPasswordConfirmed {
    return  newPasswordController.text ==
        newPasswordConformationController.text;
  }

  String get code {
    return _code = _firstController.text +
        _secondController.text +
        _thirdController.text +
        _fourthController.text;
  }

  Future forgetPassword() async {
    bool status = await AuthApiController().resetPassword(
      context,
     mobile: widget.mobile,
      password: newPasswordConformationController.text,
      code: code,
    );
    if(status){
      Navigator.pop(context);
    }
  }
}
