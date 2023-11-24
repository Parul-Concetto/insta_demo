import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:insta_demo/ui/common/asset_images.dart';
import 'package:insta_demo/ui/common/widgets/text_widget.dart';
import 'package:insta_demo/ui/userPost/controllers/user_post_controller.dart';

class CommentList extends StatelessWidget {
  const CommentList({Key? key, required this.controller, required this.index})
      : super(key: key);
  final UserPostController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              child: Image.asset(
                controller.userCommentList[index].image ?? '',
                height: 38.h,
                width: 38.w,
              ),
            ),
            SizedBox(
              width: 11.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CommonText(
                      text: controller.userCommentList[index].name ?? '',
                      size: 13.sp,
                      fontWeight: FontWeight.w500,
                      textColor: context.theme.colorScheme.primaryContainer,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    commonDot(),
                    SizedBox(
                      width: 5.w,
                    ),
                    CommonText(
                      text: controller.userCommentList[index].minutes ?? '',
                      size: 12.sp,
                      fontWeight: FontWeight.w500,
                      textColor: context.theme.colorScheme.primaryContainer
                          .withOpacity(0.7),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    commonDot(),
                    SizedBox(
                      width: 5.w,
                    ),
                    CommonText(
                      text: 'Reply',
                      size: 12.sp,
                      fontWeight: FontWeight.w500,
                      textColor: context.theme.colorScheme.primaryContainer
                          .withOpacity(0.7),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                CommonText(
                  text: controller.userCommentList[index].comment ?? '',
                  size: 13.sp,
                  fontWeight: FontWeight.w400,
                  textColor: context.theme.colorScheme.primaryContainer,
                ),
              ],
            ),
          ],
        ).marginOnly(
          bottom: 20.h,
        ),
        Image.asset(
          color: context.theme.colorScheme.primaryContainer.withOpacity(0.5),
          PNGPath.likeIcon,
          height: 20.h,
          width: 20.w,
        )
      ],
    );
  }

  Widget commonDot() {
    return Container(
      height: 5.h,
      width: 5.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
    );
  }
}
