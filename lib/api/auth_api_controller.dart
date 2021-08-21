import 'dart:convert';
import 'dart:io';

import 'package:b_store/models/home.dart';
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
        body: {'mobile': mobile, 'password': password},
        headers:baseHeader);

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
  Future<int?> Resgister(BuildContext context,
      {required String mobile, required String password,required String name,required String STORE_API_KEY, required String gender,required  int  city_id}) async {
    var response = await http.post(getUrl(ApiSettings.REGISTER),
        body: {
      'mobile': mobile,
          'password': password,
          'name':name,
          'STORE_API_KEY':STORE_API_KEY,
          'gender':gender,
          'city_id':city_id.toString(),
    },
    headers:baseHeader );

    if (isSuccessRequest(response.statusCode)) {
      showMessage(context, response);

      return jsonDecode(response.body)['code'];

    } else if (response.statusCode != 500) {
      showMessage(context, response,error: true);
    }
    handleServerError(context);
    return null;
  }
  Future<bool> updateProfile(BuildContext context,
      {required String name, required String gender,required  int  city_id}) async {
    var response = await http.post(getUrl(ApiSettings.POST_PROFILE),
        body: {
          'name':name,
          'gender':gender,
          'city_id':city_id.toString(),
        },
        headers: {
          HttpHeaders.authorizationHeader: StudentPreferences().token,
          'X-Requested-With': 'XMLHttpRequest',
          'lang': StudentPreferences().languageCode,
          'Accept': 'application/json'
    });

    if (isSuccessRequest(response.statusCode)) {
      showMessage(context, response);

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
        .post(getUrl(ApiSettings.FORGET_PASSWORD), body: {'mobile': mobile},headers: baseHeader);
    print('CODE: ${jsonDecode(response.body)['code']}');
    if (isSuccessRequest(response.statusCode)) {
      showSnackBar(context, message:'CODE: ${jsonDecode(response.body)['code']}');
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
        },
        headers: baseHeader
        );
    print('CODE: ${jsonDecode(response.body)['code']}');
    if (isSuccessRequest(response.statusCode)) {
      showMessage(context, response);
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
      headers:requestHeaders,
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
      headers: baseHeader,
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
  Future<bool> changePassword(BuildContext context,
      {required String current_password,
        required String new_password,
        required String new_password_confirmation}) async {
    var response = await http.post(
      getUrl(ApiSettings.POST_CHANGE_PASSWORD),
      body: {
        'current_password': current_password,
        'new_password': new_password,
        'new_password_confirmation': new_password_confirmation,
      },
      headers: requestHeaders,
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

  Future<String> refreshFcmToken( {required String newFcmToken}) async {
    var response = await http.post(
        getUrl(ApiSettings.refresh_fcm_token),
        body: {
          'fcm_token': newFcmToken,
        },
        headers: header
    );
    if (isSuccessRequest(response.statusCode)) {
      return newFcmToken;
    }
    return 'false';
  }

}