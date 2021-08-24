import 'dart:convert';
import 'package:b_store/models/card.dart';
import 'package:b_store/utils/api_mixin.dart';
import 'package:b_store/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api_settings.dart';



class CardApiController with ApiMixin ,Helpers{

  Future<List<MyCard>> getAllCard() async {
    var response = await http.get(getUrl(ApiSettings.CARD), headers: requestHeaders);
    if (isSuccessRequest(response.statusCode)) {
      var data = jsonDecode(response.body)['list'] as List;
      List<MyCard> cards = data.map((e) => MyCard.fromJson(e)).toList();
      return cards;
    }
    return [];
  }


  Future<MyCard?> createCard({required BuildContext context
    , required String holderName,
    required String cardNumber,
    required String expDate,
    required String cvv,
    required String type,
  }) async {

    var response = await http.post(
      getUrl(ApiSettings.CARD),
      headers: requestHeaders,
      body: {
        'holder_name': holderName,
        'card_number': cardNumber,
        'exp_date': expDate,
        'cvv': cvv.toString(),
        'type': type,
      },
    );

    if (isSuccessRequest(response.statusCode)) {
      var jsonObject = jsonDecode(response.body)['object'];
      print('true');
      showMessage(context, response);

      return MyCard.fromJson(jsonObject);
    }
    else if (response.statusCode != 500) {
      showMessage(context, response, error: true);
      print('ERROR >>>>>>> ${jsonDecode(response.body)['message']}');
    }
    handleServerError(context);
    return null;
  }

}
