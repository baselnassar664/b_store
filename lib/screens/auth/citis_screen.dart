import 'package:b_store/get/cities_controller.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/cities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CitiesScreen extends StatefulWidget {
  const CitiesScreen({Key? key}) : super(key: key);

  @override
  _CitiesScreenState createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  CitiesGetxController controller=Get.put(CitiesGetxController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: GetX<CitiesGetxController>(
        builder: (CitiesGetxController controller) {
          return controller.cities.isEmpty
              ? Center(
            child: CircularProgressIndicator(),
          )
              :  ListView.separated(
            padding:  EdgeInsets.only(
              top: SizeConfig.scaleTextFont(30),
              left: SizeConfig.scaleWidth(30),
              right:  SizeConfig.scaleWidth(30),
            ),
            shrinkWrap: true,
            itemCount: controller.cities.length,
            itemBuilder: (context, index) {
              return CityWidget(
                city: controller.cities[index],
                onTap: () => Get.back(result: controller.cities[index]),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 0,
                color: Colors.grey,
              );
            },
          );
        },
      ),
    );
  }
}
