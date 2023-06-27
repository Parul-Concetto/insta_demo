import 'package:get/get.dart';

import '../../di/api_provider.dart';
import '../../di/device_info_manager.dart';
import '../../di/di.dart';
import '../../di/network_service.dart';
import '../../di/progress_service.dart';
import '../../di/shared_preference_service.dart';
import '../../repositary/repository.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    DependencyProvider.registerSingleton<NetworkService>(NetworkService(),
        permanent: true);
    DependencyProvider.registerSingleton<SharedPreferenceService>(
        SharedPreferenceService(),
        permanent: true);
    DependencyProvider.registerSingleton<DeviceInfoManager>(DeviceInfoManager(),
        permanent: true);
    DependencyProvider.registerSingleton<ProgressService>(ProgressService(),
        permanent: true);

    DependencyProvider.registerSingleton<BaseApiProvider>(BaseApiProviderImpl(),
        permanent: true);
    DependencyProvider.registerSingleton<MainRepository>(
        MainRepositoryImpl(DependencyProvider.get()),
        permanent: true);
  }
}
