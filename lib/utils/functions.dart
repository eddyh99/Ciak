import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:email_validator/email_validator.dart';

void printDebug(Object object) {
  if (kDebugMode) {
    print(object);
  }
}

String? validateEmail(String? email) {
  dynamic isValid = EmailValidator.validate('$email');

  // Navigator.pop(context);
  if (email == null || email.isEmpty) {
    return "Please enter your email";
  }

  if (!isValid) {
    return "Please enter a valid email";
  }

  return null;
}

bool validatePassword(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

Future<String> ciakAPI(Uri url, String body) async {
  final prefs = await SharedPreferences.getInstance();
  var email = prefs.getString("email");
  var passwd = prefs.getString("passwd");
  var ucode = prefs.getString("ucode");

  String token = '';
  var headers = {'Content-Type': 'application/json'};
  if (email != null && passwd != null && ucode != null) {
    token = sha1.convert(utf8.encode(email + passwd + ucode)).toString();
  }
  if (token.isNotEmpty) {
    headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }

  Response response = await post(url, headers: headers, body: body);
  if (response.statusCode != 200) {
    throw response.body;
  }
  return response.body;
}

readPrefStr(String key) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  return jsonDecode(pref.getString(key)!);
}
