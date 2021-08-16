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
    var url = Uri.parse(ApiSettings.GET_CITIES);
    var response = await http.get(url,headers:requestHeaders );
    if(response.statusCode == 200){
      CitiesResponse citiesResponse =  CitiesResponse.fromJson(jsonDecode(response.body));
      return  citiesResponse.list;
    }
    return [];
  }
}