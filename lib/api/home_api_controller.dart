import 'dart:convert';
import 'dart:developer';

import 'package:b_store/models/home.dart';
import 'package:b_store/utils/api_mixin.dart';
import 'package:b_store/utils/helpers.dart';
import 'package:http/http.dart' as http;

import 'api_settings.dart';
class HomeApiController with  ApiMixin, Helpers{
  Future<HomeModel?>  getHome() async {
    var response = await http.get(getUrl(ApiSettings.GET_HOME),headers:header);
    log('get home api=> ${response.body}');
    if (isSuccessRequest(response.statusCode)) {
      var data = jsonDecode(response.body);
      HomeModel model =HomeModel.fromJson(data);
      log('return');
      return model;
    }else{
      return null;
    }
  }

}