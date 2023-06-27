
import 'package:get/get.dart';
import 'package:insta_demo/ui/auth/forgot_password/bindings/forgot_password_binding.dart';
import 'package:insta_demo/ui/auth/forgot_password/views/forgot_password_view.dart';
import 'package:insta_demo/ui/auth/login/views/login_view.dart';
import 'package:insta_demo/ui/auth/reset_password/bindings/reset_password_binding.dart';
import 'package:insta_demo/ui/auth/reset_password/views/reset_password_view.dart';
import 'package:insta_demo/ui/auth/verify_otp/bindings/verify_otp_binding.dart';
import 'package:insta_demo/ui/auth/verify_otp/views/verify_otp_view.dart';

import '../ui/auth/login/bindings/login_binding.dart';
import '../ui/auth/register/bindings/register_binding.dart';
import '../ui/auth/register/views/register_view.dart';
import '../ui/dashboard/bindings/dashboard_binding.dart';
import '../ui/dashboard/views/dashboard_view.dart';
import '../ui/dashboard/views/profile_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const String INITIAL = Routes.ROOT;
  static final routes = [
    GetPage(
      page: () => const DashboardView(),
      name: _Paths.ROOT,
      binding: DashboardBinding(),
      children: [
        GetPage(page: () => const ProfileView(), name: _Paths.PROFILE_PAGE),
      ],
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_OTP,
      page: () => const VerifyOTPView(),
      binding: VerifyOTPBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
  ];
}