import 'package:b_store/api/favorite_product_apt_controller.dart';
import 'package:b_store/models/favoruite.dart';
import 'package:b_store/models/productdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class FavoriteGetController extends GetxController{
  final  FavoriteProductApiController favoriteProductApiController =  FavoriteProductApiController();
  RxList<ProudctDetails> favorite = <ProudctDetails>[].obs;
  RxBool loading = false.obs;

  static FavoriteGetController get to => Get.find();

  void onInit() {
    getFavorite();
    super.onInit();
  }

  Future<void> getFavorite() async {
    loading.value = true;
    favorite.value=await FavoriteProductApiController().getFavorite();
    loading.value = false;
    update();
  }
  Future<void> addFavorite(BuildContext context,{required int product_id}) async {
    loading.value = true;
    favorite.value=(await  FavoriteProductApiController().addFavorite(context, product_id: product_id)) as List<ProudctDetails>;
    loading.value = false;
    update();
  }
}