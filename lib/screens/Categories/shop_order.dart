import 'package:b_store/creadit_card/display_card_screen.dart';
import 'package:b_store/get/cart_controller.dart';
import 'package:b_store/get/order_controller.dart';
import 'package:b_store/models/adress.dart';
import 'package:b_store/models/card.dart';
import 'package:b_store/screens/address/adress_screen.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/helpers.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/app_elevatedbutton.dart';
import 'package:b_store/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class shopOrder extends StatefulWidget {
  final String cart;

  shopOrder({required this.cart});

  @override
  _shopOrderState createState() => _shopOrderState();
}

class _shopOrderState extends State<shopOrder> with Helpers{
  bool isOnline = true;
  AddressDetails? address;
  MyCard? card;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,

      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical:SizeConfig.scaleHeight(30),
        horizontal:SizeConfig.scaleWidth(30), ),
        children: [
          GestureDetector(
            onTap: () async {
              AddressDetails selectedAddress = await Get.to(AddressScreen(
                fromOrder: true,
              ));
              setState(() {
                address = selectedAddress;
              });
            },
            child: Container(
              padding: EdgeInsetsDirectional.only(start: SizeConfig.scaleWidth(28), end: SizeConfig.scaleWidth(10)),
              alignment: AlignmentDirectional.centerStart,
              height: SizeConfig.scaleHeight(50),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF999999).withAlpha(25),
                      offset: Offset(0, 5),
                      blurRadius: 10,
                      spreadRadius: 0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey)),
              child: Row(
                children: [
                  getAddress(),
                  Spacer(),
                  Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: AppColors.app_color,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: SizeConfig.scaleWidth(20)),
          GestureDetector(
            onTap: () async {
              MyCard selectedCard = await Get.to(DisplayCardScreen(fromOrder: true,));
              setState(() {
                card = selectedCard;
              });
            },
            child: Container(
                padding: EdgeInsetsDirectional.only(start: SizeConfig.scaleWidth(28), end: SizeConfig.scaleWidth(10)),
                alignment: AlignmentDirectional.centerStart,
                height:SizeConfig.scaleHeight(50),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF999999).withAlpha(25),
                        offset: Offset(0, 5),
                        blurRadius: 10,
                        spreadRadius: 0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.grey)),
                child: Row(
                  children: [
                    getCard(),
                    Spacer(),
                    Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: AppColors.app_color,
                    )
                  ],
                )),
          ),
          SizedBox(height: SizeConfig.scaleHeight(20),),
          Row(
            children: [
              Expanded(
                child: CheckboxListTile(
                  checkColor: Colors.white,
                  activeColor: AppColors.app_color,
                  value: isOnline,
                  onChanged: (var selected) {
                    setState(() {
                      isOnline = true;
                    });
                  },
                  title: AppText(
                    text: 'Online',
                    fontsize: SizeConfig.scaleTextFont(13),
                    color: AppColors.app_color,
                  ),
                ),
              ),
              VerticalDivider(
                color: Colors.red,
                width: SizeConfig.scaleWidth(50),
                thickness: 5,
              ),
              Expanded(
                child: CheckboxListTile(
                  checkColor: Colors.white,
                  activeColor: AppColors.app_color,
                  value: !isOnline,
                  onChanged: (var selected) {
                    setState(() {
                      isOnline = false;
                    });
                  },
                  title: AppText(
                   text: 'Offline',
                    fontsize: SizeConfig.scaleTextFont(13),
                    color: AppColors.app_color,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.scaleHeight(42),),
          AppElevatedButton(
            text: 'Confirm Order',
            onPressed: () async => await performOrder(),
          ),
        ],
      ),
    );
  }

  Widget getCard() {
    if (card == null) {
      return AppText(
        text: 'Select Card',
        color: Colors.grey,
        fontsize: SizeConfig.scaleTextFont(13),
      );
    } else {
      return AppText(
        text: card!.cardNumber,
        color: AppColors.app_color,
        fontsize: SizeConfig.scaleTextFont(13),
      );
    }
  }

  Widget getAddress() {
    if (address == null) {
      return AppText(
        text: 'Select Address',
        color: Colors.grey,
        fontsize: SizeConfig.scaleTextFont(13),
      );
    } else {
      return AppText(
       text: address!.info,
        color: AppColors.app_color,
        fontsize: SizeConfig.scaleTextFont(13),
      );
    }
  }

  Future<void> performOrder() async {
    if (checkData())
      await makeOrder();
    else
      showSnackBar(context, message: 'Enter Required Data');
  }

  bool checkData() {
    if (card != null && address != null) return true;
    return false;
  }

  Future<void> makeOrder() async {
    bool status = await OrderGetxController.to.createOrder(
        context: context,
        cart: widget.cart,
        paymentType: isOnline ? 'Online' : 'Offline',
        addressId: address!.id,
        cardId: card!.id);
    if (status) {
      await CartGetxController.to.deleteAllItem();
      Get.back();
    }
  }
}