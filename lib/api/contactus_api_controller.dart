import 'dart:io';

import 'package:b_store/preferences/student_preferences.dart';
import 'package:b_store/utils/api_mixin.dart';
import 'package:b_store/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'api_settings.dart';

class ContactApiController with Helpers ,ApiMixin{
  Future<bool> contact(BuildContext context,
      {required String subject,
        required String message,}) async {
    var response = await http.post(
      getUrl(ApiSettings.POST_CONTACT),
      body: {
        'subject': subject,
        'message': message,

      },
      headers: requestHeaders
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