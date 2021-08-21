import 'dart:convert';

import 'package:b_store/models/categories_response.dart';
import 'package:b_store/models/ciites_response.dart';
import 'package:b_store/models/cities.dart';
import 'package:b_store/utils/api_mixin.dart';
import 'package:b_store/utils/helpers.dart';
import 'package:http/http.dart' as http;

import 'api_settings.dart';
class CitiesApiController with  ApiMixin, Helpers{
  Future<List<Cities>> getCities() async {
    var response = await http.get(getUrl(ApiSettings.GET_CITIES),headers: {'Accept': 'application/json'});
    if (isSuccessRequest(response.statusCode)) {
      var data = jsonDecode(response.body)['list'] as List;
      List<Cities> cities = data.map((e) => Cities.fromJson(e)).toList();
      return cities;
    }
    return [];
  }
}