import 'package:b_store/get/adress_controller.dart';
import 'package:b_store/models/adress.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/adresswidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_adress_screen.dart';



class AddressScreen extends StatelessWidget {
  AddressGetController controller = Get.put(AddressGetController());
  final bool fromOrder;

  AddressScreen({this.fromOrder = false});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetX<AddressGetController>(
        builder: (AddressGetController controller) {
          return controller.loading.value
              ? Center(child: CircularProgressIndicator())
              : controller.addresses.isNotEmpty
              ? Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(30), vertical: SizeConfig.scaleHeight(30)),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: controller.addresses.length,
              shrinkWrap: true,

              itemBuilder: (context, index) {
                return AddressWidget(
                  address: controller.addresses[index],
                  onTap: () => popScreen(address: controller.addresses[index]),
                );
              },
            ),
          )
              : Center(child: Text('Add Address',style: TextStyle(fontSize: SizeConfig.scaleTextFont(30)),),);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddAddressScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
  popScreen({required AddressDetails address}) {
    if (fromOrder) Get.back(result: address);
  }
}