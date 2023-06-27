import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_demo/ui/common/app_constants.dart';
import 'package:insta_demo/ui/common/validator.dart';
import '../../../../routes/app_pages.dart';

class VerifyOTPController extends GetxController with Validator {
  final formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  FocusNode otpFN = FocusNode();

  Timer? resendOTPTimer;
  Duration timerDuration = resendOTPDelay;
  final RxInt seconds = 0.obs;

  void verifyOTP() async {
    if (formKey.currentState!.validate()) {
      Get.offNamed(Routes.RESET_PASSWORD);
    } else {
      // Error
    }
  }

  void startTimer() {
    resendOTPTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    resendOTPTimer?.cancel();
  }

  void resetTimer() {
    if (seconds.value == -1) {
      stopTimer();
      seconds.value = 0;
      timerDuration = resendOTPDelay;
      startTimer();
    }
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    seconds.value = timerDuration.inSeconds - reduceSecondsBy;
    if (seconds < 0) {
      resendOTPTimer?.cancel();
    } else {
      timerDuration = Duration(seconds: seconds.value);
    }
  }

  @override
  void onClose() {
    stopTimer();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
    startTimer();
  }
}
