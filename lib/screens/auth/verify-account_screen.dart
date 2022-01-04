import 'package:b_store/api/auth_api_controller.dart';

import 'package:b_store/screens/auth/sign_in_screen.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/helpers.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/App_Text_Filed.dart';
import 'package:b_store/widget/app_elevatedbutton.dart';
import 'package:b_store/widget/app_text.dart';
import 'package:b_store/widget/appar_text.dart';
import 'package:b_store/widget/container_verify_account.dart';
import 'package:b_store/widget/image_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
class VerifyAccountScreen extends StatefulWidget {
final String mobile;

VerifyAccountScreen({required this.mobile});

  @override
  _VerifyAccountScreenState createState() => _VerifyAccountScreenState();
}

class _VerifyAccountScreenState extends State<VerifyAccountScreen> with Helpers {
  String _code = '';
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
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.only(
          top: SizeConfig.scaleHeight(35),
          left: SizeConfig.scaleWidth(45),
          right: SizeConfig.scaleWidth(45),

        ),
        children: [
          ImageAuth(),
          SizedBox(height: SizeConfig.scaleHeight(50),) ,
          AppText(text: 'Verify \nyour account', color: AppColors.app_text1, fontsize: SizeConfig.scaleTextFont(25),fontWeight: FontWeight.w700,),

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
          AppElevatedButton(text: 'Submit', onPressed:() async{
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
    if (_firstController.text.isNotEmpty && _secondController.text.isNotEmpty && _thirdController.text.isNotEmpty &&   _fourthController.text.isNotEmpty ){
      return true;
    }
    showSnackBar(context, message: 'Enter all code',error: true);
    return false;
  }
  String get code {
    return _code = _firstController.text +
        _secondController.text +
        _thirdController.text +
        _fourthController.text;
  }

  Future sumbitAccount()async{
   bool  active=    await AuthApiController() .activeCode(context, mobile: widget.mobile, code: code) ;
   if (active){
     Get.off(SignInScreen());
   }
  }
}