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
  Future<List< SubCategories>> getSubCategory({required int id}) async {
    var response = await http.get(getUrl(ApiSettings.GET_CATEGORIES + '/$id'),headers: header);
    if (isSuccessRequest(response.statusCode)) {
      var data = jsonDecode(response.body)['list'] as List;
      List< SubCategories> subCategories = data.map((e) =>  SubCategories.fromJson(e)).toList();
      return subCategories;
    }
    return [];
  }
}