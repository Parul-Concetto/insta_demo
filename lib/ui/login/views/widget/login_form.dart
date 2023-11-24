import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_demo/routes/app_pages.dart';
import 'package:insta_demo/ui/common/strings.dart';
import 'package:insta_demo/ui/common/widgets/button_widget.dart';
import 'package:insta_demo/ui/common/widgets/commonLinkText.dart';
import 'package:insta_demo/ui/common/widgets/text_from_field_widget.dart';
import 'package:insta_demo/ui/common/widgets/text_widget.dart';
import 'package:insta_demo/ui/login/controllers/login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
            ),
            CommonText(
              text: mobileNo,
              textColor: context.theme.colorScheme.secondaryContainer,
              size: 13.sp,
              fontFamily: context.theme.textTheme.labelSmall?.fontFamily,
            ),
            SizedBox(
              height: 10.h,
            ),
            CommonMobileTextField(
              textEditController: controller.mobileNoController,
              focusNode: controller.mobileFn,
              textInputType: TextInputType.number,
              labelText: '',
              filledColor: context.theme.colorScheme.primary,
            ),
            SizedBox(
              height: 21.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: otp,
                  textColor: context.theme.colorScheme.secondaryContainer,
                  size: 13.sp,
                  fontFamily: context.theme.textTheme.labelSmall?.fontFamily,
                ),
                CommonLinkText(label: forgotPasswordTitle, onTap: () {})
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            OTPTextFormField(
              onChanged: (value) {},
              onSubmitted: (value) {},
              textEditController: controller.otpNoController,
              focusNode: controller.otpFn,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              text: signin,
              onTap: () => Get.toNamed(Routes.USER_POST),
            ),
          ],
        ),
      ),
    );
  }
}
