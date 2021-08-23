import 'package:b_store/get/adress_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_adress_screen.dart';
import 'adress_widget.dart';


class AddressScreen extends StatelessWidget {
  AddressGetController controller = Get.put(AddressGetController());

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
            padding: EdgeInsets.symmetric(horizontal: 29, vertical: 10),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: controller.addresses.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return AddressWidget(address: controller.addresses[index],);
              },
            ),
          )
              : Center(child: Text('No Address'));
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
}