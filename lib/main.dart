import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_demo/di/network_service.dart';
import 'package:insta_demo/di/progress_service.dart';
import 'package:insta_demo/di/shared_preference_service.dart';
import 'package:insta_demo/routes/app_pages.dart';
import 'package:insta_demo/ui/common/strings.dart';
import 'package:insta_demo/ui/common/translation_service.dart';
import 'package:insta_demo/ui/common/utils.dart';
import 'package:insta_demo/ui/common/widgets/custom_progress_dialog.dart';
import 'package:insta_demo/ui/global/global_binding.dart';
import 'package:insta_demo/ui/global/global_controller.dart';

import 'ui/common/theme_resource.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

Future<void> initServices() async {
  await Get.putAsync(() => ProgressService().init());
  await Get.putAsync(() => SharedPreferenceService().init());
  await Get.putAsync(() => NetworkService().init());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> with GlobalController {
  @override
  void initState() {
    // Getting current Theme and set to the app
    ThemeResource().getSelectedThemeMode();
    super.initState();
  }

  String get initialRoute =>
      sharedPreferenceService.getLoggedInStatus() ? Routes.INIT : Routes.LOGIN;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),//TODO: Change design size
      builder: (_, __) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        enableLog: true,
        initialBinding: GlobalBinding(),
        //  logWriterCallback:(message,__)=> AppLogger.getLogger().w(message),//TODO: check this
        initialRoute: initialRoute,
        theme: ThemeResource().lightTheme,
        darkTheme: ThemeResource().darkTheme,
        themeMode: ThemeResource().themeMode ?? ThemeMode.system,
        getPages: AppPages.routes,
        locale: TranslationService.locale,
        fallbackLocale: TranslationService.fallbackLocale,
        translations: TranslationService(),
        builder: (context, widget) {
          return Obx(() {
            return Stack(
              children: [
                IgnorePointer(
                    ignoring: Get.find<ProgressService>().showProgress.value,
                    child: widget),
                SafeArea(
                  child: AnimatedContainer(
                      height:
                      Get.find<NetworkService>().isConnectedToInternet.value
                          ? 0
                          : 100.h,
                      duration: Utils.animationDuration,
                      color: ThemeData().primaryColor,
                      child: Material(
                        type: MaterialType.transparency,
                        child: Center(
                            child: Text(StringConstants.noInternetConnection,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                    fontSize: 40.sp,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground))),
                      )),
                ),
                Get.find<ProgressService>().showProgress.isTrue
                    ? const Center(child: CustomProgressDialog())
                    : const Offstage()
              ],
            );
          });
        },
      ),
    );
  }
}
