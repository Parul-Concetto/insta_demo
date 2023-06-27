import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:insta_demo/models/post.dart';
import 'package:insta_demo/routes/app_pages.dart';
import 'package:insta_demo/ui/common/asset_images.dart';
import 'package:insta_demo/ui/common/strings.dart';
import 'package:insta_demo/ui/common/widgets/shimmer_widget.dart';

import '../../common/theme_resource.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstants.posts,
            style: context.textTheme.labelLarge?.copyWith(
              fontSize: 50.sp,
              color: context.theme.colorScheme.primaryContainer,
            )),
        backgroundColor: context.theme.colorScheme.primary,
        actions: [
          InkWell(
            onTap: () => controller.sharedPreferenceService.logoutUser(),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
          ),
          Center(
            child: ThemeResource().themeSelectionIcon(context),
          ),
        ],
      ),
      body: SafeArea(
          bottom: false,
          child: Obx(() => Container(
                color: context.theme.colorScheme.onBackground,
                child: controller.isLoading.value
                    ? ShimmerWidget(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return const PostShimmer();
                            },
                            separatorBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 70.w),
                                child: Divider(
                                  thickness: 2.h,
                                  color: context.theme.colorScheme.outline,
                                ),
                              );
                            },
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            itemCount: controller.isLoading.value
                                ? 10
                                : controller.listPosts.length))
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          return PostList(post: controller.listPosts[index]);
                        },
                        separatorBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 70.w),
                            child: Divider(
                              thickness: 2.h,
                              color: context.theme.colorScheme.outline,
                            ),
                          );
                        },
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        itemCount: controller.isLoading.value
                            ? 10
                            : controller.listPosts.length),
              ))),
    );
  }
}

class PostShimmer extends StatelessWidget {
  const PostShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 70.w, vertical: 20.h),
      child: Column(
        children: <Widget>[
          ShimmerWidget(width: double.infinity, height: 50.h, borderRadius: 5),
          SizedBox(height: 10.h),
          ShimmerWidget(width: double.infinity, height: 50.h, borderRadius: 5),
        ],
      ),
    );
  }
}

class PostList extends StatelessWidget {
  const PostList({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.PROFILE_PAGE, arguments: post);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 70.w, vertical: 20.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                      child: Text(post.title,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(fontSize: 38.sp))),
                  SizedBox(height: 10.h),
                  Flexible(
                      child: Text(post.body,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                  fontSize: 32.sp,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer))),
                  SizedBox(height: 10.h),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text('Submit',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(fontSize: 32.sp)))
                ],
              ),
            ),
            SizedBox(width: 20.w),
            SvgPicture.asset(
              SVGPath.menu,
              color: context.theme.colorScheme.onSurface,
              width: 30.h,
              height: 30.h,
            )
          ],
        ),
      ),
    );
  }
}
