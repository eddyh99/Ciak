import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'data_user.dart';

Future<User> postLogin(String email, String pass) async {
  Map<String, dynamic> jsonMap = {"uname": email, "pass": pass};

  final response = await http.post(
    Uri.parse('https://api.ciak.live/auth/login'),
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    },
    encoding: Encoding.getByName('utf-8'),
    body: {"uname": email, "pass": pass},
  );

  // print(jsonDecode(response.body));

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create user.');
  }
}
