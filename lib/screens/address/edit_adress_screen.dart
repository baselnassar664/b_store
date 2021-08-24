import 'package:b_store/get/adress_controller.dart';
import 'package:b_store/models/adress.dart';
import 'package:b_store/preferences/student_preferences.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/helpers.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/App_Text_Filed.dart';
import 'package:b_store/widget/app_elevatedbutton.dart';
import 'package:b_store/widget/app_text.dart';
import 'package:flutter/material.dart';


class EditAddressScreen extends StatefulWidget {
  final AddressDetails address;

  EditAddressScreen({required this.address});

  @override
  _EditAddressScreenState createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> with Helpers{
  late TextEditingController nameEditingController;
  late TextEditingController infoEditingController;
  late TextEditingController contactNumberEditingController;

  @override
  void initState() {
    super.initState();
    nameEditingController = TextEditingController(text: widget.address.name);
    infoEditingController = TextEditingController(text: widget.address.info);
    contactNumberEditingController =
        TextEditingController(text: widget.address.contactNumber);
  }

  @override
  void dispose() {
    nameEditingController.dispose();
    infoEditingController.dispose();
    contactNumberEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical:SizeConfig.scaleHeight(30),horizontal: SizeConfig.scaleWidth(30) ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              child: AppText(text: 'Phone Number',color: Colors.grey, fontsize:SizeConfig.scaleTextFont(13),),
              padding: EdgeInsets.all(10),
            ),
            AppTextFiled(
              textEditingController: contactNumberEditingController,
              hintText: 'Phone Number',
              prefixIcon: Icons.phone_android,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: SizeConfig.scaleHeight(20)),
            Padding(
              child: AppText(text: 'Name',color: Colors.grey,fontsize:SizeConfig.scaleTextFont(13),),
              padding: EdgeInsets.all(10),
            ),
            AppTextFiled(
              textEditingController: nameEditingController,
              hintText: 'Name',
              prefixIcon: Icons.person,
            ),
            SizedBox(height:  SizeConfig.scaleHeight(15)),
            Padding(
              child: AppText(text: 'Info',color: Colors.grey,fontsize:SizeConfig.scaleTextFont(13),),
              padding: EdgeInsets.all(10),
            ),
            AppTextFiled(
              textEditingController: infoEditingController,
              hintText: 'info : Country, City, Street',
              prefixIcon: Icons.location_city_sharp,
            ),
            SizedBox(height: SizeConfig.scaleHeight(42)),
            AppElevatedButton(
              text: 'Edit',

              onPressed: () async {
                await performEdit();
              },
            ),
            SizedBox(
              height: SizeConfig.scaleHeight(170),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> performEdit() async {
    if (checkData()) {
      await save();
    }
  }

  bool checkData() {
    if (nameEditingController.text.isNotEmpty &&
        infoEditingController.text.isNotEmpty &&
        contactNumberEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context, message: 'Enter Required Fields', error: true);
    return false;
  }

  Future<void> save() async {
    AddressDetails address = AddressDetails();
    address.id = widget.address.id;
    address.name = nameEditingController.text;
    address.contactNumber = contactNumberEditingController.text;
    address.info = infoEditingController.text;
    address.cityId = StudentPreferences().student.cityId;
    bool status = await AddressGetController.to.updateAddress(context: context, address: address);
    if (status) {
      Navigator.pop(context);
    } else {
      showSnackBar(context, message: 'error', error: true);
    }
  }
}