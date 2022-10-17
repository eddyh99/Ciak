import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'data_user.dart';

Future getMyProfileData(String id, String ucode, String rcode, String header,
    String profile, String nickname, String timezone) async {
  final response = await http.post(
    Uri.parse('https://api.ciak.live/my/profile/'),
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    },
    encoding: Encoding.getByName('utf-8'),
    body: {
      "id": id,
      "ucode": ucode,
      "rcode": rcode,
      "header": header,
      "profile": profile,
      "nickname": nickname,
      "timezone": timezone
    },
  );

  // print(jsonDecode(response.body));

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return jsonDecode(response.body);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to get data.');
  }
}

Future getOtherProfileData(String id, String ucode, String rcode, String header,
    String profile, String nickname, String timezone) async {
  final response = await http.post(
    Uri.parse('https://api.ciak.live/my/profile/$ucode'),
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    },
    encoding: Encoding.getByName('utf-8'),
    body: {
      "id": id,
      "ucode": ucode,
      "rcode": rcode,
      "header": header,
      "profile": profile,
      "nickname": nickname,
      "timezone": timezone
    },
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return jsonDecode(response.body);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to get data.');
  }
}
