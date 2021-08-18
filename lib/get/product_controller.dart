import 'package:b_store/api/product_api_controller.dart';
import 'package:b_store/models/product.dart';
import 'package:get/get.dart';

class ProudctGetController extends GetxController{
  final ProductApiController productApiController = ProductApiController();
  RxList<Product> proudct = <Product>[].obs;
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
}