import 'package:b_store/get/card_screen.dart';
import 'package:b_store/models/card.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/my_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'creat_card.dart';


class DisplayCardScreen extends StatelessWidget {
  CardGetxController controller = Get.put(CardGetxController());
  final bool fromOrder;

  DisplayCardScreen({this.fromOrder = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetX<CardGetxController> (
        builder: (CardGetxController controller){
          return controller.loading.value
              ? Center(child: CircularProgressIndicator())
              : controller.cards.isNotEmpty
              ? Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(30), vertical: SizeConfig.scaleHeight(10)),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: controller.cards.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    popScreen(card: controller.cards[index]);
                  },
                  child: MyCardWidget(
                    expiryDate: controller.cards[index].expDate,
                    flag: false,
                    cardHolderName: controller.cards[index].holderName,
                    cardNumber: controller.cards[index].cardNumber,
                    cardType: controller.cards[index].type == 'Visa' ? CardType.visa : CardType.mastercard,
                  ),
                );
              },
            ),
          )
              : Center(child: Text('Add card',style: TextStyle(fontSize: SizeConfig.scaleTextFont(30)),));
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.to(CreateCreditCard());
        },
        backgroundColor: AppColors.app_color,
        child: Icon(Icons.add),
      ),
    );
  }

  popScreen({required MyCard card}) {
    print(fromOrder);
    if (fromOrder) Get.back(result: card);
  }
}