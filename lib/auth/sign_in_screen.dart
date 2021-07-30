import 'package:b_store/utils/AppColors.dart';
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

class _SignInScreenState extends State<SignInScreen> {
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
            AppTextFiled(hintText: 'Mobile Number',keyboardType: TextInputType.number,prefixIcon: Icons.phone_android),
            SizedBox(height: SizeConfig.scaleHeight(20),),
            AppTextFiled(hintText: 'Password',prefixIcon: Icons.lock,),
            SizedBox(height: SizeConfig.scaleHeight(10),),
            Align(
              alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context,'/recover_account_screen');
                  },
                    child: AppText(text: 'Forgot Password?', color: AppColors.app_color, fontsize: SizeConfig.scaleTextFont(12),fontWeight: FontWeight.w700,))),
            SizedBox(height: SizeConfig.scaleHeight(40),),
            AppElevatedButton(text: 'Sign in', onPressed:(){}),
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
}
