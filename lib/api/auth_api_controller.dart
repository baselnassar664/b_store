import 'dart:convert';

import 'package:b_store/models/student.dart';
import 'package:b_store/preferences/student_preferences.dart';
import 'package:b_store/utils/api_mixin.dart';
import 'package:b_store/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'api_settings.dart';
class AuthApiController with Helpers ,ApiMixin{
  Future<bool> login(BuildContext context,
      {required String mobile, required String password}) async {
    var response = await http.post(getUrl(ApiSettings.LOGIN),
        body: {'mobile': mobile, 'password': password});

    if (isSuccessRequest(response.statusCode)) {
      var jsonResponse = jsonDecode(response.body);
      var jsonObject = jsonResponse['data'];

      Student student = Student.fromJson(jsonObject);
      await StudentPreferences().save(student);

      return true;
    } else if (response.statusCode != 500) {
      showMessage(context, response,error: true);
    }
    handleServerError(context);
    return false;
  }
}