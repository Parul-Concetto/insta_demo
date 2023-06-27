
import 'package:get/get.dart';
import 'package:insta_demo/di/progress_service.dart';
import 'package:insta_demo/di/shared_preference_service.dart';
import 'package:insta_demo/repositary/repository.dart';
import '../../di/device_info_manager.dart';

mixin GlobalController {
  ProgressService get progressService => Get.find();

  SharedPreferenceService get sharedPreferenceService => Get.find();

  DeviceInfoManager get deviceInfoManager => Get.find();

  MainRepository get repository => Get.find();
}
