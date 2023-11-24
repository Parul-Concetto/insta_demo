part of 'app_pages.dart';

// ignore_for_file: constant_identifier_names
abstract class Routes {
  Routes._();
  static const INIT = DASHBOARD;
  static const LOGIN = _Paths.LOGIN;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const USER_POST =  _Paths.USER_POST;
}

abstract class _Paths {
  _Paths._();
  static const LOGIN = '/login';
  static const DASHBOARD = '/dashboard';
  static const USER_POST = '/user-post';
}
