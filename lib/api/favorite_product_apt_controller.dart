import 'dart:io';


import 'package:b_store/models/favoruite.dart';
import 'package:b_store/models/productdetails.dart';
import 'package:b_store/preferences/student_preferences.dart';
import 'package:b_store/utils/api_mixin.dart';
import 'package:b_store/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api_settings.dart';
class  FavoriteProductApiController  with  ApiMixin, Helpers{
  Future<List<ProudctDetails>> getFavoriteProducts() async {
    var response = await http.get(getUrl(ApiSettings.GET_Favorite),headers: {
      'Accept':'application/json',
      HttpHeaders.authorizationHeader: StudentPreferences().token,
      'X-Requested-With': 'XMLHttpRequest',
    });
    if (isSuccessRequest(response.statusCode)) {
      var data = jsonDecode(response.body)['list'] as List;
      List<ProudctDetails> favoriteProducts = data.map((e) => ProudctDetails.fromJson(e)).toList();
      return favoriteProducts;
    }
    return [];
  }
  Future<bool> addFavoriteProducts(BuildContext context, {required int id}) async {
    var response = await http.post(
        getUrl(ApiSettings.GET_Favorite),
        body: {'product_id': id.toString()},
        headers: requestHeaders
    );
    if (isSuccessRequest(response.statusCode)) {
      showMessage(context, response);
      return true;
    } else if (response.statusCode != 500) {
      showMessage(context, response, error: true);
    }else{
      handleServerError(context);
    }
    return false;
  }

}