import 'dart:convert';

import 'package:b_store/models/productdetails.dart';
import 'package:b_store/utils/api_mixin.dart';
import 'package:b_store/utils/helpers.dart';
import 'package:http/http.dart' as http;

import 'api_settings.dart';
class ProductDetailsApiController with  ApiMixin, Helpers{

  Future <ProudctDetails?> getproductdetails({required int id}) async {
    var response = await http.get(getUrl(ApiSettings.GET_PRODUCT_DETAILS+ '/$id'),headers:requestHeaders);
    if (isSuccessRequest(response.statusCode)) {
      var data = jsonDecode(response.body)['object'];
      var productDetails = ProudctDetails.fromJson(data);
      return productDetails;
    }
  }
}