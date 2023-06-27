import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/validator.dart';

class RegisterController extends GetxController with Validator  {

  final formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode firstNameFN = FocusNode();
  FocusNode lastNameFN = FocusNode();
  FocusNode mobileFN = FocusNode();
  FocusNode emailFN = FocusNode();
  FocusNode passwordFN = FocusNode();

  void registerUser() {
    if(formKey.currentState!.validate()){
      log('Registered Successful!');
      Get.back();
    }
  }
}