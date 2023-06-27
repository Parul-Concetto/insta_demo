import 'package:flutter/material.dart';

class AppException implements Exception {
  String message;

  AppException(this.message);

  showException(
      {String title = 'Sorry',
      String affirmativeButtonText = 'Ok',
      String? negativeButtonText,
      VoidCallback? onAffirmativeButtonTap,
      VoidCallback? onNegativeButtonTap,
      bool isDismissible = true}) {
    debugPrint(message);
  }
}
