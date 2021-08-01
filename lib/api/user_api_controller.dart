import 'dart:convert';
import 'dart:io';

import 'package:b_store/models/user.dart';
import 'package:b_store/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'api_settings.dart';
class UserApiController with Helpers,ApiSettings {
  Future<bool> login(BuildContext context,
      {required String email, required String password}) async {
    var response = await http.post(getUrl(ApiSettings.LOGIN),
        body: {'email': email, 'password': password});

    if (isSuccessRequest(response.statusCode)) {
      var jsonResponse = jsonDecode(response.body);
      var jsonObject = jsonResponse['object'];

     User user = User.fromJson(jsonObject);
      await StudentPreferences().save(student);

      return true;
    } else if (response.statusCode != 500) {
      showMessage(context, response);
    }
    handleServerError(context);
    return false;
  }

  Future<bool> logout(BuildContext context) async {
    var response = await http.get(
      getUrl(ApiSettings.LOGOUT),
      headers: {
        HttpHeaders.authorizationHeader: StudentPreferences().token,
        'X-Requested-With': 'XMLHttpRequest'
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200 ||
        response.statusCode == 401 ||
        response.statusCode == 403) {
      await StudentPreferences().logout();
      return true;
    } else {
      handleServerError(context);
    }
    return false;
  }

  Future<bool> forgetPassword(BuildContext context,
      {required String email}) async {
    var response = await http
        .post(getUrl(ApiSettings.FORGET_PASSWORD), body: {'email': email});
    print('CODE: ${jsonDecode(response.body)['code']}');
    if (isSuccessRequest(response.statusCode)) {
      return true;
    } else if (response.statusCode != 500) {
      showMessage(context, jsonDecode(response.body));
    } else {
      handleServerError(context);
    }
    return false;
  }

  Future<bool> resetPassword(BuildContext context,
      {required String email,
        required String password,
        required String code}) async {
    var response = await http.post(
      getUrl(ApiSettings.RESET_PASSWORD),
      body: {
        'email': email,
        'code': code,
        'password': password,
        'password_confirmation': password,
      },
    );

    print(response.body);
    if (isSuccessRequest(response.statusCode)) {
      showMessage(context, response);
      return true;
    } else if (response.statusCode != 500) {
      showMessage(context, response, error: true);
    }else{
      handleServerError(context);
    }

    return false;
  }
}