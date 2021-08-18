
import 'package:b_store/models/sub_categories.dart';
import 'package:b_store/api/sub_categories_api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SubCategoryController extends GetxController{
  final SubCategoriesApiController subcategoryApiController = SubCategoriesApiController();
  RxList<SubCategories> subcategories= <SubCategories>[].obs;
  static SubCategoryController get to => Get.find();
  void onInit() {

    super.onInit();
  }

  Future<void> getSubCategory({required int id}) async {
    subcategories.value = await SubCategoriesApiController().getSubCategory(id: id);
    update();
  }
}