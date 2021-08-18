import 'package:b_store/api/address_api_controller.dart';
import 'package:b_store/models/adress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AddressGetController extends GetxController{
  final AddressApiController addressApiController = AddressApiController();
  RxList<AddressDetails> addresses = <AddressDetails>[].obs;
  RxBool loading = false.obs;
  static AddressGetController get to => Get.find();
  void onInit() {
    getAddresses();
    super.onInit();
    addresses.refresh();
  }

  Future<void> getAddresses() async {
    loading.value = true;
    addresses.value = await addressApiController.getAllAddress();
    loading.value = false;
    update();
  }
}

