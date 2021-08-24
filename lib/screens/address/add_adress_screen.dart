import 'package:b_store/get/adress_controller.dart';
import 'package:b_store/models/adress.dart';
import 'package:b_store/preferences/student_preferences.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/helpers.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/App_Text_Filed.dart';
import 'package:b_store/widget/adresswidget.dart';
import 'package:b_store/widget/app_elevatedbutton.dart';
import 'package:b_store/widget/app_text.dart';
import 'package:b_store/widget/appar_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> with Helpers{
  late TextEditingController nameEditingController;
  late TextEditingController infoEditingController;
  late TextEditingController contactNumberEditingController;


  @override
  void initState() {
    super.initState();
    nameEditingController = TextEditingController();
    infoEditingController = TextEditingController();
    contactNumberEditingController = TextEditingController();
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
        centerTitle: true,
        title: ApparText(
          text: 'Add Address',
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(
          top: SizeConfig.scaleHeight(30),
          left: SizeConfig.scaleWidth(30),
          right:  SizeConfig.scaleWidth(30),
        ),
        children: [
          SizedBox(height: SizeConfig.scaleHeight(32)),
          AppTextFiled(
            textEditingController: contactNumberEditingController,
            maxLength: 9,
            prefixIcon: (Icons.phone_android),
            hintText: 'Phone Number',
           keyboardType: TextInputType.phone,
          ),
          SizedBox(height:SizeConfig.scaleHeight(20)),
          AppTextFiled(
            textEditingController: nameEditingController,
            hintText: 'Name',
            prefixIcon: (Icons.person),
          ),
          SizedBox(height: SizeConfig.scaleHeight(20)),
          AppTextFiled(
            textEditingController: infoEditingController,
            hintText: 'info : Country, City, Street',
            prefixIcon: (Icons.location_city_sharp),
          ),
          SizedBox(height: SizeConfig.scaleHeight(42)),
          AppElevatedButton(
            text: 'Add',
            onPressed: () async {
              await performAdd();
            },
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(170),
          ),
        ],
      ),
    );
  }

  Future<void> performAdd() async {
    if (checkData()) {
      await save();
    }
  }

  bool checkData() {
    if (
    nameEditingController.text.isNotEmpty &&
        infoEditingController.text.isNotEmpty &&
        contactNumberEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context, message: 'Enter Required Fields', error: true);
    return false;
  }

  Future<void> save() async {
    AddressDetails address = AddressDetails();
    address.name = nameEditingController.text;
    address.contactNumber = contactNumberEditingController.text;
    address.info = infoEditingController.text;
    address.cityId = StudentPreferences().student.cityId;

    bool status = await AddressGetController.to.createAddress(
        context: context,
        address: address
    );
    if (status) {
      Navigator.pop(context);
    } else {
      showSnackBar(context, message: 'error', error: true, );
    }
  }
}
