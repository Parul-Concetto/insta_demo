import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_demo/routes/app_pages.dart';
import 'package:insta_demo/ui/common/asset_images.dart';
import 'package:insta_demo/ui/common/strings.dart';
import 'package:insta_demo/ui/common/widgets/button_widget.dart';
import 'package:insta_demo/ui/common/widgets/text_widget.dart';
import 'package:insta_demo/ui/login/views/widget/login_form.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

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
                child: Image.asset(
                  PNGPath.bgImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: 25,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 17.h,
                      ),
                      Image.asset(
                        PNGPath.backIcon,
                        height: 36.h,
                        width: 36.w,
                        alignment: Alignment.topLeft,
                      ).marginOnly(left: 10),
                      SizedBox(
                        height: 81.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CommonText(
                          text: signInToInstagram,
                          textColor: context.theme.colorScheme.primaryContainer,
                          size: 36,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: CommonText(
                          text: enterYourDetailsBelow,
                          textColor:
                              context.theme.colorScheme.secondaryContainer,
                          size: 16.sp,
                          fontFamily:
                              context.theme.textTheme.labelSmall?.fontFamily,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      LoginForm(controller: controller),
                      SizedBox(
                        height: 41.h,
                      ),
                      linkText(context),
                      SizedBox(
                        height: 28.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          PNGPath.logo,
                          height: 40.h,
                          width: 40.w,
                          alignment: Alignment.center,
                        ),
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
