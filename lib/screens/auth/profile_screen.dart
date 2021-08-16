
import 'package:b_store/preferences/student_preferences.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/App_Text_Filed.dart';

import 'package:b_store/widget/image_auth.dart';
import 'package:flutter/material.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _nameController;

  int selectCity=0;
  int selectGender=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController=TextEditingController(text: StudentPreferences().student.name);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
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
        padding:  EdgeInsets.only(    top: SizeConfig.scaleHeight(30),
            left: SizeConfig.scaleWidth(30),
            right: SizeConfig.scaleWidth(30)),
        child: Column(
          children: [
            ImageAuth(),
            SizedBox(height: SizeConfig.scaleHeight(50),),
            AppTextFiled(
              textEditingController: _nameController,
              hintText: 'Name',prefixIcon: Icons.person,),
              SizedBox(height: SizeConfig.scaleHeight(20),),
            SizedBox(height: SizeConfig.scaleHeight(20),),

          ],
        ),
      ),
    );
  }
}
