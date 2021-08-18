import 'dart:convert';

import 'package:b_store/models/product.dart';
import 'package:b_store/models/productdetails.dart';
import 'package:b_store/utils/api_mixin.dart';
import 'package:b_store/utils/helpers.dart';

import 'api_settings.dart';
import 'package:http/http.dart' as http;
class ProductDetailsApiController with  ApiMixin, Helpers{
  Future<List< Product>> getProduct({required int id}) async {
    var response = await http.get(getUrl(ApiSettings.GET_PRODUCT + '/$id'),headers:requestHeaders);
    if (isSuccessRequest(response.statusCode)) {
      var data = jsonDecode(response.body)['list'] as List;
      List< Product> product = data.map((e) =>  Product.fromJson(e)).toList();
      return product;
    }
    return [];
  }
  Future <ProudctDetails?> getproductdetails({required int id}) async {
    var response = await http.get(getUrl(ApiSettings.GET_PRODUCT_DETAILS + '/$id'),headers:requestHeaders);
    if (isSuccessRequest(response.statusCode)) {
      var data = jsonDecode(response.body)['object'];
      var productDetails = ProudctDetails.fromJson(data);
      return productDetails;
    }
  }
}