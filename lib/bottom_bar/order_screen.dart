import 'package:b_store/get/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  OrderGetxController  controller=Get.put( OrderGetxController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold();
  }
}
