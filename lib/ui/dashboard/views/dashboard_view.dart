import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_demo/routes/app_pages.dart';
import 'package:insta_demo/ui/common/asset_images.dart';
import 'package:insta_demo/ui/common/widgets/button_widget.dart';

import '../../common/strings.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    gradient: RadialGradient(
                        radius: 5,
                        colors: [Color(0xFF262628), Color(0xFF262628)])),
                child: Image.asset(
                  PNGPath.bgImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Container(
                height: 380.h,
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomButton(
                        text: signInWithGmail,
                        onTap: () {},
                        bgColor: context.theme.colorScheme.primaryContainer,
                        textColor: context.theme.colorScheme.primary,
                        isIconVisible: true,
                        prefixIcon: PNGPath.google,
                      ),
                      CustomButton(
                        text: signInWithMobile,
                        onTap: () => Get.toNamed(Routes.LOGIN),
                      ),
                      SizedBox(
                        height: 41.h,
                      ),
                      linkText(context),
                      SizedBox(
                        height: 28.h,
                      ),
                      Image.asset(
                        PNGPath.logo,
                        height: 40.h,
                        width: 40.w,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Align linkText(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: notAMember,
              style: TextStyle(
                color: context.theme.colorScheme.secondaryContainer,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(
              text: signupNow,
              style: TextStyle(
                color: context.theme.disabledColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              /* recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.toNamed(),*/
            ),
          ],
        ),
      ),
    );
  }
}
