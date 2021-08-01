import 'package:b_store/api/auth_api_controller.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/helpers.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/App_Text_Filed.dart';
import 'package:b_store/widget/app_elevatedbutton.dart';
import 'package:b_store/widget/app_text.dart';
import 'package:b_store/widget/image_auth.dart';
import 'package:flutter/material.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> with Helpers{
  late TextEditingController _mobileEditingController;
  late TextEditingController _passwordEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mobileEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _mobileEditingController.dispose();
    _passwordEditingController.dispose();
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
              textEditingController: _mobileEditingController,
                hintText: 'Mobile Number',keyboardType: TextInputType.number,prefixIcon: Icons.phone_android),
            SizedBox(height: SizeConfig.scaleHeight(20),),
            AppTextFiled(
              textEditingController: _passwordEditingController,
                hintText: 'Password',prefixIcon: Icons.lock,keyboardType: TextInputType.number),
            SizedBox(height: SizeConfig.scaleHeight(10),),
            Align(
              alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context,'/recover_account_screen');
                  },
                    child: AppText(text: 'Forgot Password?', color: AppColors.app_color, fontsize: SizeConfig.scaleTextFont(12),fontWeight: FontWeight.w700,))),
            SizedBox(height: SizeConfig.scaleHeight(40),),
            AppElevatedButton(text: 'Sign in', onPressed:()async{
              await performLogin();
            }),
            Spacer(),

            InkWell(
              onTap: (){
                Navigator.pushNamed(context, '/sign_up_screen');
              },
                child: AppText(text: 'Create an account?', color: AppColors.app_color, fontsize: SizeConfig.scaleTextFont(14),fontWeight: FontWeight.w600,textAlign: TextAlign.center))
          ],
        ),
      ),
    );
  }
  Future performLogin() async {
    if (checkData()) {
      await login();
    }
  }
  bool checkData() {
    if (_mobileEditingController.text.isNotEmpty &&
        _passwordEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context, message: 'Enter required data!',error: true);
   return false;
  }
  Future login() async {
    bool loggedIn = await AuthApiController().login(context,
       mobile: _mobileEditingController.text,
        password: _passwordEditingController.text);
    if (loggedIn) {
      showSnackBar(context, message: 'You are logged in successfully ');
       Future.delayed(Duration(seconds: 3),(){
         Navigator.pushReplacementNamed(context,   '/main_screen');
       });
    }
  }
}
