import 'package:b_store/api/product_api_controller.dart';
import 'package:b_store/models/product.dart';
import 'package:b_store/models/productdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProudctGetController extends GetxController{
  final ProductApiController productApiController = ProductApiController();
  RxList<ProudctDetails> proudct = < ProudctDetails>[].obs;
  RxList<ProudctDetails> favoriteProducts = <ProudctDetails>[].obs;
  Rx<ProudctDetails?> proudctdetails= ProudctDetails().obs;
  RxBool loading = false.obs;


  static ProudctGetController get to => Get.find();

  void onInit() {
    super.onInit();
    getFavoriteProducts();
  }

  Future<void> getproduct({required int id}) async {
    loading.value = true;
    proudct.value = await productApiController.getProduct(id: id);
    loading.value = false;
    update();
  }

  Future<void> getproudctdetails({required int id}) async {
    loading.value = true;
    proudctdetails.value = await  productApiController.getproductdetails(id: id);
    loading.value = false;
    proudctdetails.refresh();
    proudct.refresh();
    favoriteProducts.refresh();
    update();
  }
  Future<void> getFavoriteProducts() async {
    loading.value = true;
    favoriteProducts.value = await ProductApiController().getFavoriteProducts();
    loading.value =false;
    proudctdetails.refresh();
    proudct.refresh();
    favoriteProducts.refresh();
    update();
  }

  Future<void> addFavoriteProducts({required ProudctDetails product,required BuildContext context}) async {
    bool status = await productApiController.addFavoriteProducts(context, id: product.id);
    if(status){
      int index = favoriteProducts.indexWhere((element) => element.id == product.id);
      if(index != -1) {
        favoriteProducts.removeAt(index);
        proudctdetails.value!.isFavorite = !proudctdetails.value!.isFavorite;
      } else {
        favoriteProducts.add(product);
        proudctdetails.value!.isFavorite = !proudctdetails.value!.isFavorite;
      }
    }
    proudctdetails.refresh();
    proudct.refresh();
    favoriteProducts.refresh();
    update();
  }


  Future<void> rattingProduct({required ProudctDetails product,required BuildContext context,required double rate}) async {
    await productApiController.productRate(context, id: product.id,ratting: rate);

    favoriteProducts.refresh();
    update();
  }
}
