import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

Future getBlocked(String id, String ucode, String rcode, String header,
    String profile, String nickname, String timezone) async {
  try {
    final response = await http.post(
      Uri.parse('https://api.ciak.live/lists/blocked'),
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
      return jsonDecode(response.body)["error"]["data"];
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
    }
  } on Exception catch (e) {
    log('error caught: $e');
  } catch (e) {
    log('error caught: $e');
  }
}
