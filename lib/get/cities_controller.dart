import 'package:b_store/api/cities_api_controller.dart';
import 'package:b_store/models/cities.dart';

import 'package:b_store/preferences/student_preferences.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get.dart';
class CitiesGetxController extends GetxController {
  final CitiesApiController citiesApiController = CitiesApiController();
  RxList<Cities> cities = <Cities>[].obs;
  RxBool loading = false.obs;
  static CitiesGetxController get to => Get.find();

  void onInit() {

    getCities();
    super.onInit();
  }

  Future<void> getCities() async {

    loading.value = true;
    cities.value = await citiesApiController.getCities();
    loading.value = false;
    update();
  }

  String getCityNameById({required int id}){
    int index = cities.indexWhere((element) => element.id == id);
    String cityName = StudentPreferences().languageCode == 'en' ? cities[index].nameEn:cities[index].nameAr;
    return cityName;
  }

}