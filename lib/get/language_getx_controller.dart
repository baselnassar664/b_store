

import 'package:b_store/preferences/student_preferences.dart';
import 'package:get/get.dart';

class LanguageGetxController extends GetxController{

  RxString languageCode = 'ar'.obs;

  static LanguageGetxController get to => Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    languageCode.value = StudentPreferences().languageCode;
    super.onInit();
  }

  void changeLanguage(String newLanguageCode) {
    languageCode.value = newLanguageCode;
    print('NEW VALUE: ${languageCode.value}');
    StudentPreferences().setLanguage(newLanguageCode);
  }
}