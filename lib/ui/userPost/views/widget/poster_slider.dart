import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_demo/ui/common/asset_images.dart';
import 'package:insta_demo/ui/common/widgets/text_widget.dart';
import 'package:insta_demo/ui/userPost/controllers/user_post_controller.dart';

class PostSlider extends StatelessWidget {
  const PostSlider({
    super.key,
    required this.controller,
  });

  final UserPostController controller;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [1, 2, 3, 4, 5]
          .map(
            (i) => Stack(
              children: [
                Image.asset(
                  PNGPath.postPerson,
                  height: 305.h,
                  width: Get.width,
                ),
                Positioned(
                  bottom: 10.h,
                  right: 15.w,
                  left: 15.w,
                  child: Container(
                    padding: EdgeInsets.only(left: 8.w),
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    height: 50.h,
                    decoration: BoxDecoration(
                      color:
                          context.theme.colorScheme.primary.withOpacity(0.35),
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: context.theme.colorScheme.primary
                                .withOpacity(0.50),
                            borderRadius: BorderRadius.circular(25.r),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 14.w, vertical: 5.h),
                          height: 34.h,
                          child: Row(
                            children: [
                              Image.asset(
                                PNGPath.likeIcon,
                                height: 24.h,
                                width: 24.w,
                                color:
                                    context.theme.colorScheme.primaryContainer,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              CommonText(
                                text: '5.2K',
                                textColor:
                                    context.theme.colorScheme.primaryContainer,
                                size: 13.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 14.w,
                        ),
                        Image.asset(
                          PNGPath.commentIcon,
                          height: 24.h,
                          width: 24.w,
                          color: context.theme.colorScheme.primaryContainer,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        CommonText(
                          text: '140',
                          textColor: context.theme.colorScheme.primaryContainer,
                          size: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          width: 14.w,
                        ),
                        Image.asset(
                          PNGPath.message,
                          height: 24.h,
                          width: 24.w,
                          color: context.theme.colorScheme.primaryContainer,
                        ),
                        SizedBox(
                          width: 62.w,
                        ),
                        Image.asset(
                          PNGPath.bookmarkIcon,
                          height: 78.h,
                          width: 53.w,
                          color: context.theme.colorScheme.primaryContainer,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
          .toList(),
      options: CarouselOptions(
        height: 300.h,
        aspectRatio: 1.0,
        enlargeCenterPage: true,
        viewportFraction: 1,
        enableInfiniteScroll: false,
        onPageChanged: (index, reason) {
          controller.current.value = index;
        },
      ),
    );
  }
}
