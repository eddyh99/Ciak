import 'dart:convert';

import 'package:ciak_live/models/user/user_model.dart';
import 'package:ciak_live/utils/functions.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  late UserModel signedUser;

  Future<Map<String, dynamic>> logIn(
      {required String email, required String password}) async {
    Uri url = Uri.https("api.ciak.live", "/V1/Auth/login");
    try {
      http.Response response = await http.post(url,
          body: jsonEncode({
            "email": email,
            "password": password,
          }),
          headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        Map<String, dynamic> decodedResponse =
            jsonDecode(response.body) as Map<String, dynamic>;
        Map<String, dynamic> userData =
            jsonDecode(decodedResponse["message"]) as Map<String, dynamic>;
        return {"login": true, "user": userData};
      } else {
        return {"login": false, "user": null};
      }
    } catch (e) {
      printDebug("Failed to Login: $e");
      return {"login": false, "user": null};
    }
  }
}
