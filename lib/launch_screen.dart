

import 'package:b_store/get/cities_controller.dart';
import 'package:b_store/get/product_controller.dart';
import 'package:b_store/preferences/student_preferences.dart';
import 'package:b_store/screens/boarding/boarding_screen.dart';
import 'package:b_store/screens/bottom_bar/main_screen.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/app_text.dart';
import 'package:b_store/widget/image_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'get/adress_controller.dart';
import 'get/cart_controller.dart';
import 'get/order_controller.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  CartGetxController controller=Get.put(CartGetxController());
  CartGetxController controllerCart=Get.put(CartGetxController());
  CitiesGetxController controllerCities=Get.put(CitiesGetxController());
  AddressGetController  controllerAddress=Get.put(AddressGetController ());
  OrderGetxController controllerOrder=Get.put( OrderGetxController());
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Widget route = StudentPreferences().isLoggedIn ? MainScreen() :  BoardingScreen();
      Get.off(route);
    });
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageAuth(),
          SizedBox(height: SizeConfig.scaleHeight(30),),
          AppText(text: 'B Store', color:AppColors.app_text1, fontsize: SizeConfig.scaleTextFont(25),fontWeight: FontWeight.w700,),
        ],
      ),
    );
  }
}
