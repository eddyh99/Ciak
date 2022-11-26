import 'dart:convert';

import 'package:ciak_live/models/post/post_model.dart';
import 'package:ciak_live/utils/functions.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FeedsController extends GetxController {
  List<PostModel> feeds = [];

  Future<void> fetchDashboardFeed(String timezone, String token) async {
    Uri url = Uri.https("api.ciak.live", "/V1/my/dashboard");
    try {
      http.Response response = await http.post(url,
          body: jsonEncode({
            "timezone": timezone,
          }),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          });

      if (response.statusCode == 200) {
        Map<String, dynamic> decodedResponse =
            jsonDecode(response.body) as Map<String, dynamic>;
        if (decodedResponse["code"] == "200") {
          List<dynamic> data = List.from(decodedResponse["message"]["data"]);
          printDebug(data);
          if (data.length >= 10) {
            for (int x = 0; x < 10; x++) {
              PostModel post =
                  PostModel.fromJson(data[x] as Map<String, dynamic>);
              feeds.add(post);
            }
          } else {
            for (int x = 0; x < data.length; x++) {
              PostModel post =
                  PostModel.fromJson(data[x] as Map<String, dynamic>);
              feeds.add(post);
            }
          }
          printDebug("Fetch dashboard feeds succeed.");
          update();
        } else {
          printDebug(
              "Fetch dashboard feeds failed. (ResponeCode: ${decodedResponse["code"]})");
        }
      } else {
        printDebug(
            "Can't request fetch data to server. (StatusCode: ${response.statusCode})");
      }
    } catch (e) {
      printDebug("Failed to fetch dashboard feeds: $e");
    }
  }
}
