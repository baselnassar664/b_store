import 'package:b_store/api/categories_api_controller.dart';
import 'package:b_store/models/Categories.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
class CategoryGetxController extends GetxController{
  final CategoriesApiController categoryApiController = CategoriesApiController();
  RxList<Categories> categories = <Categories>[].obs;
  RxBool loading = false.obs;

  static CategoryGetxController get to => Get.find();

  void onInit() {
    getCategory();
    super.onInit();
  }

  Future<void> getCategory() async {
    loading.value = true;
    categories.value = await categoryApiController.getCategories();
    loading.value = false;
    update();
  }

}