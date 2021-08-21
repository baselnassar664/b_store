import 'dart:convert';

import 'package:b_store/models/adress.dart';
import 'package:b_store/utils/api_mixin.dart';
import 'package:b_store/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'api_settings.dart';
class AddressApiController with Helpers ,ApiMixin{
  Future<List<AddressDetails>> getAllAddress() async {
    var response = await http.get(getUrl(ApiSettings.GET_ADDRESS), headers: requestHeaders);
    if (isSuccessRequest(response.statusCode)) {
      var data = jsonDecode(response.body)['list'] as List;
      List<AddressDetails> addresses = data.map((e) => AddressDetails.fromJson(e)).toList();
      return addresses;
    }
    return [];
  }

  Future<AddressDetails?> createAddress({required BuildContext context, required AddressDetails address}) async {
    var response = await http.post(
      getUrl(ApiSettings.GET_ADDRESS),
      headers: requestHeaders,
      body: {
        'name': address.name,
        'info': address.info,
        'contact_number': address.contactNumber,
        'city_id': address.cityId.toString(),
        'lat': address.lat??'',
        'lang': address.lang??'',
      },
    );
    if (isSuccessRequest(response.statusCode)) {
      var jsonObject = jsonDecode(response.body)['object'];
      return AddressDetails.fromJson(jsonObject);
    }

  }

  Future<bool> updateAddress({required BuildContext context, required AddressDetails address}) async {
    var response = await http.put(
      getUrl(ApiSettings.GET_ADDRESS + '/${address.id}'),
      headers: requestHeaders,
      body: {
        'name': address.name,
        'info': address.info,
        'contact_number': address.contactNumber,
        'city_id': address.cityId.toString(),
        'lat': address.lat??'',
        'lang': address.lang??'',
      },
    );
    if (isSuccessRequest(response.statusCode)) {

      return true;
    } else if (response.statusCode != 500) {
      showMessage(context, response);
      return false;
    }
    handleServerError(context);
    return false;
  }
  Future<bool> deleteAddress({required BuildContext context, required addressId}) async {
    var response = await http.delete(
      getUrl(ApiSettings.GET_ADDRESS + '/$addressId'),
      headers: requestHeaders,
    );

    if (isSuccessRequest(response.statusCode)) {
      return true;
    } else if (response.statusCode != 500) {
      showMessage(context, response);
      return false;
    }
    handleServerError(context);
    return false;
  }

}