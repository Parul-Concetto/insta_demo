import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_demo/models/post.dart';
import 'package:insta_demo/ui/common/strings.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final post = Get.arguments as Post;
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(StringConstants.profile,
                style: context.textTheme.labelLarge?.copyWith(
                  fontSize: 50.sp,
                ))),
        backgroundColor: context.theme.colorScheme.primary,
        automaticallyImplyLeading: false,
      ),
      body: Center(child: Text(post.title)),
    );
  }
}
