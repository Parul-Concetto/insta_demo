import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:insta_demo/ui/common/strings.dart';

class DeviceInfoManager extends GetxService {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  Future<DeviceInfoManager> init() async {
    getDeviceId();
    return this;
  }

  getDeviceId() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      StringConstants.deviceId = androidInfo.id ?? '';
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      StringConstants.deviceId = iosInfo.identifierForVendor ?? '';
    }
  }
}
