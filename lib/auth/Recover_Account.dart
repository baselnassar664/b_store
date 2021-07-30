import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/helpers.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/App_Text_Filed.dart';
import 'package:b_store/widget/app_elevatedbutton.dart';
import 'package:b_store/widget/app_text.dart';
import 'package:b_store/widget/appar_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class RecoverAccount extends StatefulWidget {
  const RecoverAccount({Key? key}) : super(key: key);

  @override
  _RecoverAccountState createState() => _RecoverAccountState();
}

class _RecoverAccountState extends State<RecoverAccount> with Helpers {
  late TextEditingController _phoneTextEditingController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _phoneTextEditingController=TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _phoneTextEditingController.dispose();
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
          AppText(text: 'Recover your account', color: AppColors.app_text1, fontsize: SizeConfig.scaleTextFont(25),fontWeight: FontWeight.w700,),
          SizedBox(height: SizeConfig.scaleHeight(90),),
         AppTextFiled(
           keyboardType: TextInputType.number,
            textEditingController:  _phoneTextEditingController,
           hintText: 'Enter your phone number ',prefixIcon: Icons.phone_android,),
          SizedBox(height: SizeConfig.scaleHeight(20),),
          AppElevatedButton(text: 'Next', onPressed:() async{
          await   performePhone();
          })
        ],
      ),
    );
  }
  Future performePhone()async{
    if (checkData()){
      await confirmPhone();
    }

  }
  bool checkData(){
    if(_phoneTextEditingController.text.isNotEmpty){
      return true;
    }
    showSnackBar(context, message: 'Enter required data',error: true);
    return false;
  }
  Future confirmPhone()async{
    await Navigator.pushNamed(context,  '/verify_account_reset_password');
  }
}

