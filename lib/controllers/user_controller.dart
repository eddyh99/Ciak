import 'dart:convert';

import 'package:ciak_live/models/user/user_model.dart';
import 'package:ciak_live/utils/functions.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  UserModel? signedUser;

  Future<Map<String, dynamic>> logIn(
      {required String email, required String password}) async {
    Uri url = Uri.https("api.ciak.live", "/Auth/login");
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
        if (decodedResponse["code"] == "200") {
          Map<String, dynamic> userData =
              decodedResponse["message"] as Map<String, dynamic>;
          printDebug(
              "Login succeed. (Nickname: ${userData["nickname"]}, Timezone: ${userData["timezone"]})");
          return {"login": true, "message": userData};
        } else {
          printDebug(
              "${decodedResponse["message"]}. (ResponeCode: ${decodedResponse["code"]})");
          return {"login": false, "message": decodedResponse["message"]};
        }
      } else {
        printDebug(
            "Can't request login to server. (StatusCode: ${response.statusCode})");
        return {"login": false, "message": "Can't request login to server."};
      }
    } catch (e) {
      printDebug("Failed to Login: $e");
      return {"login": false, "message": "There is a critical error occurred"};
    }
  }
}
