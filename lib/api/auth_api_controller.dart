import 'dart:convert';
import 'dart:io';

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
  Future<bool> active(BuildContext context,
      {required String mobile, required String code}) async {
    var response = await http.post(getUrl(ApiSettings.LOGIN),
        body: {'mobile': mobile, 'code': code});

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
  Future<bool> Resgister(BuildContext context,
      {required String mobile, required String password,required String name,required String STORE_API_KEY, required String gender,required String city_id}) async {
    var response = await http.post(getUrl(ApiSettings.REGISTER),
        body: {
      'mobile': mobile,
          'password': password,
          'name':name,
          'STORE_API_KEY':STORE_API_KEY,
          'gender':gender,
          'city_id':city_id,
    });

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
  Future<bool> forgetPassword(BuildContext context,
      {required String mobile}) async {
    var response = await http
        .post(getUrl(ApiSettings.FORGET_PASSWORD), body: {'mobile': mobile});
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
  Future<bool>  activeCode(BuildContext context,
      {required String mobile,required String code}) async {
    var response = await http
        .post(getUrl(ApiSettings.ACTIVATE), body: {
          'mobile': mobile,
      'code':code,
        });
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
  Future<bool> resetPassword(BuildContext context,
      {required String mobile,
        required String password,
        required String code}) async {
    var response = await http.post(
      getUrl(ApiSettings.RESET_PASSWORD),
      body: {
        'mobile': mobile,
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