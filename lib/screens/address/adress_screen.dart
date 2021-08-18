import 'package:b_store/get/adress_controller.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/adresswidget.dart';
import 'package:b_store/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  AddressGetController controller=Get.put(AddressGetController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body: GetX< AddressGetController>(
        builder: ( AddressGetController controller) {
          return controller.loading.value
              ? Center(
            child: CircularProgressIndicator(),
          )
              :  controller.addresses.isNotEmpty?
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 29, vertical: 10),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: controller.addresses.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return AddressWidget(address: controller.addresses[index],);
              },
            ),
          ) : Center(child: Text('no data',style: TextStyle(fontSize: SizeConfig.scaleTextFont(50)),));
        },
      ),
    );
  }
}
