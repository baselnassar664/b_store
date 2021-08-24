import 'package:b_store/get/card_screen.dart';
import 'package:b_store/models/card.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/helpers.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/app_elevatedbutton.dart';
import 'package:b_store/widget/app_text.dart';
import 'package:b_store/widget/card_text_filed.dart';
import 'package:b_store/widget/my_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class CreateCreditCard extends StatefulWidget {
  const CreateCreditCard({Key? key}) : super(key: key);

  @override
  _CreateCreditCardState createState() => _CreateCreditCardState();
}

class _CreateCreditCardState extends State<CreateCreditCard> with Helpers{
  String? cardNumber;
  String? expiryDate;
  String? cardHolderName;
  String? cvvCode;
  bool flag = false;
  bool isVisa = true;
  DateTime? _pickedDateValue;
  String? _pickedDate;
  late TextEditingController numberEditingController;
  late TextEditingController dateEditingController;
  late TextEditingController cvvEditingController;
  late TextEditingController holderNameEditingController;

  @override
  void initState() {
    numberEditingController = TextEditingController();
    dateEditingController = TextEditingController();
    cvvEditingController = TextEditingController();
    holderNameEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: SizeConfig.scaleHeight(30),horizontal: SizeConfig.scaleWidth(30),),
        child: Column(
          children: [

            Expanded(
              child: ListView(
                children: [
                  CardTextField(
                    controller: numberEditingController,
                    label: 'card number',
                    hint: 'XXXX XXXX XXXX XXXX',
                    textInputType: TextInputType.number,
                    length: 16,

                    onTap: () {
                      setState(() {
                        flag = false;
                      });
                    },
                    onChange: (String v) {
                      setState(() {
                        cardNumber = v;
                      });
                    },
                  ),

                  SizedBox(height:SizeConfig.scaleHeight(15),),
                  GestureDetector(
                    onTap: () async {
                      flag = false;
                      await pickDate();
                      setState(() {
                        if(_pickedDate != null){
                          List<String> list = _pickedDate!.split('-');
                          // expiryDate = expiryDate;
                          expiryDate =  list[1]+ '/' + list[0][2]+list[0][3];
                        }
                      });
                    },
                    child: Container(
                        padding: EdgeInsetsDirectional.only(start: SizeConfig.scaleHeight(30), end:  SizeConfig.scaleWidth(10),),
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
                            border: Border.all(color: Colors.grey.shade300,width: 1.5)),
                        child: Row(
                          children: [
                            Text(_pickedDate ?? 'D/M/Y'),
                            Spacer(),
                            Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: AppColors.app_color,
                            )
                          ],
                        )),
                  ),
                  SizedBox(height:SizeConfig.scaleHeight(15),),
                  CardTextField(
                    controller: cvvEditingController,
                    label: 'CVV',
                    textInputType: TextInputType.number,
                    length: 3,
                    hint: 'XXX',
                    onTap: () {
                      setState(() {
                        flag = true;
                      });
                    },
                    onChange: (String v) {
                      setState(() {
                        cvvCode = v;
                      });
                    },
                  ),
                  SizedBox(height:SizeConfig.scaleHeight(15),),
                  CardTextField(
                    controller: holderNameEditingController,
                    label: 'Holder Name',
                    hint: 'Holder Name',
                    onTap: () {
                      setState(() {
                        flag = false;
                      });
                    },
                    onChange: (String v) {
                      setState(() {
                        cardHolderName = v;
                      });
                    },
                  ),
                  SizedBox(height:SizeConfig.scaleHeight(15),),
                  Row(
                    children: [
                      Expanded(
                        child: CheckboxListTile(
                          checkColor: Colors.white,
                          activeColor: AppColors.app_color,
                          value: isVisa,
                          onChanged: (var selected) {
                            setState(() {
                              isVisa = true;
                            });
                          },
                          title: AppText(
                           text: 'VISA',
                            fontsize: SizeConfig.scaleTextFont(16),
                            color: AppColors.app_text1,
                          ),
                        ),
                      ),
                      VerticalDivider(
                        color: Colors.red,
                        width: SizeConfig.scaleWidth(30),
                        thickness: 5,
                      ),
                      Expanded(
                        child: CheckboxListTile(
                          checkColor: Colors.white,
                          activeColor: AppColors.app_color,
                          value: !isVisa,
                          onChanged: (var selected) {
                            setState(() {
                              isVisa = false;
                            });
                          },
                          title: AppText(
                            text: 'MASTER',
                            fontsize: SizeConfig.scaleTextFont(13),
                            color: AppColors.app_text1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.scaleHeight(30),),
                  AppElevatedButton(text: 'Save', onPressed: ()async {
                    await performSave(context);
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  Future pickDate() async {
    DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 61)),
      firstDate: DateTime.now().add(Duration(days: 61)),
      lastDate: DateTime.now().add(Duration(days : 365*5)),
    );
    if (dateTime != null) {
      _pickedDateValue = dateTime;
      var format = DateFormat('yyyy-MM-dd');
      _pickedDate = format.format(dateTime);
      print('Date: ${_pickedDate}');
    }
  }

  Future performSave(BuildContext context) async {
    if (checkData()) {
      await save(context);
    }
  }

  bool checkData() {
    if (_pickedDate != null &&
        numberEditingController.text.isNotEmpty &&
        holderNameEditingController.text.isNotEmpty &&
        cvvEditingController.text.isNotEmpty
    ) {
      return true;
    }
     showSnackBar(context, message: 'empty_field_error', error: true);
    return false;
  }

  Future save(BuildContext context) async {
    bool status = await CardGetxController.to.createCard(card: card,context: context);
    if (status) {
      Navigator.pop(context);
    } else {
     showSnackBar(context, message: 'error', error: true);
    }
  }

  MyCard get card {
    MyCard myCard = MyCard();
    myCard.cardNumber = numberEditingController.text;
    myCard.cvv = cvvEditingController.text;
    myCard.holderName = holderNameEditingController.text;
    myCard.expDate = _pickedDate!;
    myCard.type = isVisa ? 'Visa' : 'Master';
    return myCard;
  }
}