import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_demo/ui/common/asset_images.dart';
import 'package:insta_demo/ui/common/widgets/bottomNavigationBar.dart';
import 'package:insta_demo/ui/common/widgets/text_widget.dart';
import 'package:insta_demo/ui/userPost/views/widget/commentListItem.dart';
import 'package:insta_demo/ui/userPost/views/widget/poster_slider.dart';

import '../controllers/user_post_controller.dart';

class UserPostView extends GetView<UserPostController> {
  const UserPostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 6.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              height: 40.h,
              child: userPostHeading(context),
            ),
            SizedBox(
              height: 10.h,
            ),
            Obx(
              () => Column(
                children: [
                  PostSlider(controller: controller),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [1, 2, 3, 4, 5].asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => controller.carouselController
                            .animateToPage(entry.key),
                        child: Container(
                            width: controller.current.value == entry.key
                                ? 8.w
                                : 6.w,
                            height: controller.current.value == entry.key
                                ? 8.h
                                : 6.h,
                            margin: EdgeInsets.symmetric(
                                vertical: 8.0.h, horizontal: 4.0.w),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.current.value == entry.key
                                    ? Colors.blueAccent
                                    : Colors.grey.withOpacity(0.5))),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 26.h,
            ),
            userLikeList(context),
            SizedBox(
              height: 21.h,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                    right: 17.w, left: 17.w, top: 19.h, bottom: 0.h),
                color: context.theme.secondaryHeaderColor,
                child: ListView.builder(
                    itemCount: controller.userCommentList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CommentList(controller: controller, index: index);
                    }),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }

  Row userLikeList(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 36.h,
          width: 110.w,
          child: Stack(
              children: List.generate([1, 2, 3].length, (index) {
            return Positioned(
              left: index * 30,
              child: Container(
                height: 36.h,
                width: 36.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: context.theme.scaffoldBackgroundColor,
                        width: 3.w)),
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    PNGPath.person,
                  ),
                  radius: 10.r,
                ),
              ),
            );
          })).paddingOnly(left: 16.w),
        ),
        SizedBox(
          width: 9.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: 'Liked by',
              textColor:
                  context.theme.colorScheme.primaryContainer.withOpacity(0.6),
              size: 12.sp,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                CommonText(
                  text: 'Sean, John, ',
                  textColor: context.theme.colorScheme.primaryContainer,
                  size: 13.sp,
                  fontWeight: FontWeight.w700,
                ),
                CommonText(
                  text: 'and 120 others',
                  textColor: context.theme.colorScheme.primaryContainer
                      .withOpacity(0.6),
                  size: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Row userPostHeading(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          PNGPath.backIcon,
          height: 36.h,
          width: 36.w,
          alignment: Alignment.topLeft,
        ),
        SizedBox(
          width: 12.w,
        ),
        Stack(
          children: [
            CircleAvatar(
              child: Image.asset(
                PNGPath.person,
                height: 40.h,
                width: 40.w,
              ),
              radius: 40.r,
            ),
            Positioned(
              bottom: 3,
              right: 10,
              child: Image.asset(
                PNGPath.verifyTick,
                height: 18.h,
                width: 18.w,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: 'David Morel',
              fontWeight: FontWeight.w500,
              size: 14.sp,
              textColor: context.theme.colorScheme.primaryContainer,
            ),
            SizedBox(
              height: 2.h,
            ),
            CommonText(
              text: 'Grenoble',
              fontWeight: FontWeight.w400,
              size: 12.sp,
              textColor: context.theme.colorScheme.secondaryContainer,
            ),
          ],
        ),
        SizedBox(
          width: 100.w,
        ),
        Image.asset(
          PNGPath.followIcon,
          height: 24.h,
          width: 24.w,
        ),
      ],
    );
  }
}
