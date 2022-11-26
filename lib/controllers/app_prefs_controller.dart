import 'package:ciak_live/utils/functions.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class AppPrefs {
  static late Box prefsStorage;
  static const String storageName = "ciak.hive";
  static AppPrefs? _instance;
  factory AppPrefs() => _instance ??= AppPrefs._();
  AppPrefs._();

  static Future<void> initialize() async {
    try {
      if (!kIsWeb && !Hive.isBoxOpen(storageName)) {
        String path = (await getApplicationDocumentsDirectory()).path;
        Hive.init(path);
      }
      prefsStorage = await Hive.openBox(storageName);
    } catch (e) {
      printDebug("Failed to initialize HiveBox: $e");
    }
  }
}
