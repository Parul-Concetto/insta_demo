part of 'app_pages.dart';

// ignore_for_file: constant_identifier_names
abstract class Routes {
  Routes._();

  static const ROOT = '/';
  static const INIT = ROOT;
  static const UI = '/ui';
  static const PROFILE_PAGE = '/profile';
  static const REGISTER =_Paths.REGISTER;
  static const LOGIN =_Paths.LOGIN;
  static const FORGOT_PASSWORD =_Paths.FORGOT_PASSWORD;
  static const VERIFY_OTP =_Paths.VERIFY_OTP;
  static const RESET_PASSWORD =_Paths.RESET_PASSWORD;

}

abstract class _Paths {
  _Paths._();

  static const ROOT = '/';
  static const PROFILE_PAGE = '/profile';
  //static const UI = '/ui';
  static const REGISTER = '/register';
  static const LOGIN = '/login';
  static const FORGOT_PASSWORD = '/forgotPassword';
  static const VERIFY_OTP = '/verifyOTP';
  static const RESET_PASSWORD = '/resetPassword';

}