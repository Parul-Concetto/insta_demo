import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_demo/models/post.dart';
import 'package:insta_demo/ui/common/app_exception.dart';

import '../../global/global_controller.dart';

class DashboardController extends GetxController with GlobalController {
  RxList<Post> listPosts = <Post>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    debugPrint('onInit called');
    super.onInit();
  }

  @override
  void onReady() {
    debugPrint('The build method is done. '
        'Your controller is ready to call dialogs and snackbars');
    getDashboardPostData();
    super.onReady();
  }

  @override
  void onClose() {
    debugPrint('onClose called');
    super.onClose();
  }

  getDashboardPostData() {
    progressService.showProgressDialog(true);
    repository.getPostList().then((value) {
      progressService.showProgressDialog(false);
      listPosts.value = value;
      isLoading.value = false;
    }).catchError((error, stackTrace) {
      progressService.showProgressDialog(false);
      isLoading.value = false;
      debugPrint((error is AppException) ? error.message : error.toString());
    });
  }
}
