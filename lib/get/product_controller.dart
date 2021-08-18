import 'package:b_store/api/product_api_controller.dart';
import 'package:b_store/models/product.dart';
import 'package:b_store/models/productdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProudctGetController extends GetxController{
  final ProductApiController productApiController = ProductApiController();
  RxList< Product> proudct = < Product>[].obs;
  RxList<ProudctDetails> favoriteProducts = <ProudctDetails>[].obs;
  Rx<ProudctDetails?> proudctdetails= ProudctDetails().obs;
  RxBool loading = false.obs;


  static ProudctGetController get to => Get.find();

  void onInit() {
    super.onInit();
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
      int index = proudct.indexWhere((element) => element.id == product.id);
      proudct[index].isFavorite == false ? favoriteProducts.add(product) : favoriteProducts.removeWhere((element) => element.id == proudct[index].id);
      proudct[index].isFavorite = !proudct[index].isFavorite;
      proudctdetails.value!.isFavorite = proudct[index].isFavorite ;
    }
    proudctdetails.refresh();
    proudct.refresh();
    favoriteProducts.refresh();
    update();
  }


}