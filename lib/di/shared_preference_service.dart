import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_demo/ui/common/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/app_pages.dart';

class SharedPreferenceService extends GetxService {
  SharedPreferences? _pref;
  final String _themeMode = 'themeMode';
  final String _isLoggedIn = loginPrefKey;

  Future<bool?> clearData() async {
    return _pref?.clear();
  }

  Future<SharedPreferenceService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<ThemeMode> getThemeMode() async {
    String theme = _pref?.getString(_themeMode) ?? '';
    if (theme.isNotEmpty) {
      return ThemeMode.values.firstWhere((element) => element.name == theme);
    }
    return ThemeMode.system;
  }

  Future<dynamic> setThemeMode(ThemeMode theme) {
    return _pref!.setString(_themeMode, theme.name);
  }

  bool getLoggedInStatus() => _pref?.getBool(_isLoggedIn) ?? false;

  void setLoggedInStatus(bool isLoggedIn) async{
    _pref = await SharedPreferences.getInstance();
    _pref?.setBool(_isLoggedIn, isLoggedIn);
  }

  void logoutUser() {
    setLoggedInStatus(false);
    log('IsLoggedIn : ${getLoggedInStatus()}');
    Get.offAllNamed(Routes.LOGIN);
  }
}
