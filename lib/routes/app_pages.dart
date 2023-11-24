import 'package:get/get.dart';

import '../ui/dashboard/bindings/dashboard_binding.dart';
import '../ui/dashboard/views/dashboard_view.dart';
import '../ui/login/bindings/login_binding.dart';
import '../ui/login/views/login_view.dart';
import '../ui/userPost/bindings/user_post_binding.dart';
import '../ui/userPost/views/user_post_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.USER_POST,
      page: () => const UserPostView(),
      binding: UserPostBinding(),
    ),
  ];
}
