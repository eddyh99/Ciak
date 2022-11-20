import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';

enum Activity {
  subscription,
  following,
  bookmark,
  blockuser,
}

extension ActivityExtension on Activity {
  String? get title {
    switch (this) {
      case Activity.subscription:
        return "Subscription";
      case Activity.following:
        return "Following";
      case Activity.bookmark:
        return "Bookmark";
      case Activity.blockuser:
        return "Block User";
      default:
        return null;
    }
  }
}

extension ScreenUtils on num {
  double get w => Get.width * (this / 100);
  double get h => Get.height * (this / 100);
  double get sp => this * (Get.width / 3) / 100;
}
