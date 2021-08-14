import 'dart:convert';

import 'package:b_store/models/Categories.dart';
import 'package:b_store/models/categories_response.dart';
import 'package:b_store/models/sub_categories.dart';
import 'package:b_store/models/subcategories_respnses.dart';
import 'package:b_store/utils/api_mixin.dart';
import 'package:b_store/utils/helpers.dart';
import 'package:http/http.dart' as http;

import 'api_settings.dart';
class SubCategoriesApiController with  ApiMixin, Helpers{
  Future<List<SubCategories>> getSubCategories({required int id})  async   {
    var url = Uri.parse(ApiSettings.GET_SUBCATEGORIES);
    var response = await http.get(url,headers:requestHeaders );
    if(response.statusCode == 200){
      SubCategoriesResponse baseResponse = SubCategoriesResponse.fromJson(jsonDecode(response.body));
      return baseResponse.list;
    }
    return [];
  }
}