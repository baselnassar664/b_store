import 'dart:developer';

import 'package:b_store/api/auth_api_controller.dart';
import 'package:b_store/api/home_api_controller.dart';
import 'package:b_store/models/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeGetxController extends GetxController {
  final HomeApiController homeApiController = HomeApiController();

  HomeModel? homeModel;


  static HomeApiController get to => Get.find();

  void onInit() {
    getHome();
    super.onInit();
  }

  Future<void> getHome() async {
    HomeModel? model = await homeApiController.getHome();
    this.homeModel = model;
    log('homeApiController');
    log(model!.message);
    update();

  }


}