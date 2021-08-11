import 'dart:convert';

import 'package:b_store/models/Categories.dart';
import 'package:b_store/models/Categories.dart';
import 'package:b_store/models/Categories.dart';
import 'package:b_store/models/categories_response.dart';
import 'package:b_store/utils/api_mixin.dart';
import 'package:b_store/utils/helpers.dart';
import 'package:http/http.dart' as http;

import 'api_settings.dart';
class CategoriesApiController with ApiMixin, Helpers{
  Future<List<Categories>> getCategories() async {
    var url = Uri.parse(ApiSettings.GET_CATEGORIES);
    var response = await http.get(url,headers:requestHeaders );
    if(response.statusCode == 200){
      CategoriesResponse baseResponse = CategoriesResponse.fromJson(jsonDecode(response.body));
      return baseResponse.list;
    }
    return [];
  }
  }
