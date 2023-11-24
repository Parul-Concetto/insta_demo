import 'package:get/get.dart';

import '../controllers/user_post_controller.dart';

class UserPostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserPostController>(
      () => UserPostController(),
    );
  }
}
