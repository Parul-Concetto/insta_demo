import 'package:get/get.dart';
import 'package:insta_demo/di/di.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    DependencyProvider.registerSingleton<DashboardController>(
        DashboardController());
  }
}
