import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/helpers.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/App_Text_Filed.dart';
import 'package:b_store/widget/app_elevatedbutton.dart';
import 'package:b_store/widget/app_text.dart';
import 'package:b_store/widget/appar_text.dart';
import 'package:b_store/widget/container_verify_account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class VerifyAccountResetPassword extends StatefulWidget {
  const VerifyAccountResetPassword({Key? key}) : super(key: key);

  @override
  _VerifyAccountResetPasswordState createState() => _VerifyAccountResetPasswordState();
}

class _VerifyAccountResetPasswordState extends State<VerifyAccountResetPassword> with Helpers {
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
          AppText(text: 'Verify \nyour account to reset password', color: AppColors.app_text1, fontsize: SizeConfig.scaleTextFont(25),fontWeight: FontWeight.w700,),
          SizedBox(height: SizeConfig.scaleHeight(90),) ,
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
          SizedBox(height: SizeConfig.scaleHeight(40),) ,
          AppElevatedButton(text: 'Next', onPressed:() async{
           await peformeSumbitAccount();
          })
        ],
      ),
    );
  }
  Future peformeSumbitAccount()async{
    if(checkData()){
      await sumbitAccount();
    }

  }
  bool checkData(){
    if (_firstController.text.isNotEmpty && _secondController.text.isNotEmpty && _fourthController.text.isNotEmpty ){
      return true;
    }
    showSnackBar(context, message: 'Enter all code',error: true);
    return false;
  }
  Future sumbitAccount()async{
    await Navigator.pushNamed(context,  '/reset_password_screen');
  }
}
