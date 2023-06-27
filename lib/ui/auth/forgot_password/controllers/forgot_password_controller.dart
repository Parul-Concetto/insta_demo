import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../common/validator.dart';

class ForgotPasswordController extends GetxController with Validator{
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  FocusNode emailFN = FocusNode();

  void sendOTP() {
    if (formKey.currentState!.validate()) {
      log('OTP send successfully!');
      Get.offNamed(Routes.VERIFY_OTP);
    }
  }
}