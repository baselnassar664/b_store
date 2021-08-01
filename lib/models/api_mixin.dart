import 'dart:convert';
import 'dart:io';

import 'package:b_store/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

mixin ApiMixin implements Helpers {
  Uri getUrl(String url) {
    return Uri.parse(url);
  }

  bool isSuccessRequest(int statusCode) {
    return statusCode < 400;
  }

  void handleServerError(BuildContext context) {
    showSnackBar(
        context: context,
       message: 'Unable to perform your request now!',
        error: true);
  }

  void showMessage(BuildContext context, Response response,
      {bool error = false}) {
    showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: error);
  }

  Map<String, String> get requestHeaders {
    return {
      HttpHeaders.authorizationHeader: StudentPreferences().token,
      'X-Requested-With': 'XMLHttpRequest'
    };
  }
}
