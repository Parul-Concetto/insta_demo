import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../common/validator.dart';

class ResetPasswordController extends GetxController with Validator {
  final formKey = GlobalKey<FormState>();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode confirmPasswordFN = FocusNode();
  FocusNode passwordFN = FocusNode();

  void resetPassword() {
    if (formKey.currentState!.validate()) {
      log('Reset Password Successful!');
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
