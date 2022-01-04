import 'package:b_store/get/order_controller.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/order_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  OrderGetxController controller=Get.put( OrderGetxController());

  @override
  void initState() {
    Future.delayed(Duration.zero,()async{
      await OrderGetxController.to.getOrders();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetX<OrderGetxController>(
        builder: (OrderGetxController controller) {
          return controller.loading.value
              ? Center(child: CircularProgressIndicator())
              : controller.orders.isNotEmpty
              ? Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(30), vertical: SizeConfig.scaleHeight(10)),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: controller.orders.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return OrderWidget(
                  order: controller.orders[index],
                );
              },
            ),
          )
              : Center(child: Text('No Order',style: TextStyle(fontSize: SizeConfig.scaleTextFont(30)),));
        },
      ),
    );
  }
}
