import 'dart:convert';

import 'package:b_store/models/Categories.dart';

import 'package:b_store/utils/api_mixin.dart';
import 'package:b_store/utils/helpers.dart';
import 'package:http/http.dart' as http;

import 'api_settings.dart';
class CategoriesApiController with  ApiMixin, Helpers{
  Future<List<Categories>> getCategories() async {
    var response = await http.get(getUrl(ApiSettings.GET_CATEGORIES),headers:requestHeaders);
    if (isSuccessRequest(response.statusCode)) {
      var data = jsonDecode(response.body)['list'] as List;
      List<Categories > categories = data.map((e) => Categories .fromJson(e)).toList();
      return categories;
    }
    return [];
  }
}
