import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_demo/ui/common/validator.dart';

import '../../../../routes/app_pages.dart';
import '../../../global/global_controller.dart';

class LoginController extends GetxController with GlobalController, Validator {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFN = FocusNode();
  FocusNode passwordFN = FocusNode();

  void verifyLogin() {
    if (formKey.currentState!.validate()) {
      log('Login Successful!');
      sharedPreferenceService.setLoggedInStatus(true);
      Get.offNamed(Routes.INIT);
    }
  }
}
