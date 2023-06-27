import 'package:another_flushbar/flushbar.dart';
import 'package:get/get.dart';

class Utils {

  Utils._();
  static const animationDuration = Duration(milliseconds: 200);

  static displayFlushBar(String? message) {
    Flushbar(
      message: message,
      duration: const Duration(seconds: 3),
    ).show(Get.context!);
  }
}
