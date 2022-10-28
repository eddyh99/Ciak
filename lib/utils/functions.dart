import 'package:flutter/foundation.dart';
import 'package:open_mail_app/open_mail_app.dart';

void printDebug(Object object) {
  if (kDebugMode) {
    print(object);
  }
}

Future<bool> openMailApp() async {
  var result = await OpenMailApp.openMailApp();
  if (!result.canOpen && !result.didOpen) {
    return false;
  }
  return true;
}
