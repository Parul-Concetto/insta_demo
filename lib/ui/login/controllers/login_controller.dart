import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController otpNoController = TextEditingController();
  FocusNode mobileFn = FocusNode();
  FocusNode otpFn = FocusNode();
}
