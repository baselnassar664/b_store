import 'package:b_store/api/contactus_api_controller.dart';
import 'package:b_store/models/student.dart';
import 'package:b_store/models/student.dart';
import 'package:b_store/models/student.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/helpers.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/App_Text_Filed.dart';
import 'package:b_store/widget/app_elevatedbutton.dart';
import 'package:b_store/widget/image_auth.dart';
import 'package:flutter/material.dart';
class ContactUs extends StatefulWidget {


  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> with Helpers{
late  TextEditingController _messageController;
late  TextEditingController _subjectController;
late TextEditingController _mobileEditingController;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mobileEditingController = TextEditingController();
    _messageController= TextEditingController();
    _subjectController= TextEditingController();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    _mobileEditingController.dispose();
    _messageController.dispose();
    _subjectController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImageAuth(),
              SizedBox(height: SizeConfig.scaleHeight(50),),
               Container(
                 width:double.infinity,
                 height: SizeConfig.scaleHeight(80),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   color: Colors.white,
                   border: Border.all(
                     color: AppColors.app_color,
                   )
                 ),
                 child: TextField(

                  controller: _subjectController,
                  decoration: InputDecoration(
                    hintText: 'subject',

                          contentPadding:EdgeInsets.only(
                              top: SizeConfig.scaleHeight(10),
                              left: SizeConfig.scaleWidth(10),

                          ),
                    hintStyle: TextStyle(
                      color: AppColors.app_text1.withOpacity(0.4),
                      fontFamily: 'Poppins',

                      fontSize: SizeConfig.scaleTextFont(12),
                    ),
                      enabledBorder:InputBorder.none,
                      focusedBorder:InputBorder.none,
                  ),
                 ),
               ),
              SizedBox(height: SizeConfig.scaleHeight(20),),
              Container(
                width:double.infinity,
                height: SizeConfig.scaleHeight(150),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(
                      color: AppColors.app_color,
                    )
                ),
                child: TextField(
                controller:_messageController ,
                  decoration: InputDecoration(
                    hintText: 'message',
                    contentPadding:EdgeInsets.only(
                      top: SizeConfig.scaleHeight(10),
                      left: SizeConfig.scaleWidth(10),

                    ),
                    hintStyle: TextStyle(
                      color: AppColors.app_text1.withOpacity(0.4),
                      fontFamily: 'Poppins',

                      fontSize: SizeConfig.scaleTextFont(12),
                    ),
                    enabledBorder:InputBorder.none,
                    focusedBorder:InputBorder.none,
                  ),
                ),
              ),

              SizedBox(height: SizeConfig.scaleHeight(40),),
              AppElevatedButton(text: 'Contact us', onPressed: ()async{
                await performeContactUs();
              })
            ],
          ),
        ),
      ),
    );
  }
  Future performeContactUs()async{
  if(checkData()){
    await contactUs();
  }
  }
  Future contactUs()async{
  bool contact=  await ContactApiController().contact(context,subject: _subjectController.text,message: _messageController.text);
  if(contact){
   
  }
  }
  bool checkData(){
  if(_messageController.text.isNotEmpty && _subjectController .text.isNotEmpty){
    return true;
  }
  showSnackBar(context, message:"Enter required data",error: true);
  return false;
  }

}
