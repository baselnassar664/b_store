import 'package:b_store/preferences/student_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AppLocale extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      'hello': 'Hello World',
      'title': 'title',
      "language": "Language",
      "profile": " Profile",
      " edit_mobile": "Edit mobile",
      "change_password": "Change password",
      "address": "Addresses",
      "contact_us": "Contact us",
      "about": " About",
      "logout": "Logout",
      'home':'Home',
      'cart':'Cart',
      'favourite':'Favourite',
      'order':'Order',
      'setting': 'Setting',
      'product_available':"product available",
      'nofilcation':'Notification',
    },
    'ar': {
      'hello': 'مرحباً',
      'title': 'العنوان',
      "language":"الغة",
      "profile": " الملف الشخصي",
      " edit_mobile": "تعديل رقم الجوال",
      "change_password": "تعديل كلمة السر",
      "address": "العنوان",
      "contact_us": "اتصل بنا",
      "about": " عن التطبيق",
      "logout": "تسجيل الخروج",
       'home':' الرئيسية',
      'cart':'عربة التسوق',
      'favourite':'المفضلة',
      'order':'الطلبات',
      'setting': 'الاعدادت',
     'product_available':"المنتج متاح",
  'nofilcation':'الاشعارات',
    }
  };

  static void changeLang() {
    String newLanguageCode = StudentPreferences().languageCode == 'en' ? 'ar' : 'en';
    Get.updateLocale(Locale(newLanguageCode));
    StudentPreferences().setLanguage(newLanguageCode);
  }
}