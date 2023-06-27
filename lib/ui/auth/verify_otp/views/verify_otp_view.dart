import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_demo/ui/auth/forgot_password/views/widget/custom_back_button.dart';
import 'package:insta_demo/ui/common/strings.dart';

import '../../../common/widgets/button_widget.dart';
import '../../../common/widgets/text_from_field_widget.dart';
import '../controllers/verify_otp_controller.dart';

class VerifyOTPView extends GetView<VerifyOTPController> {
  const VerifyOTPView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 70.h,
                  ),
                  const RoundBackButton(),
                  SizedBox(
                    height: 60.h,
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      verifyOTPTitle,
                      textAlign: TextAlign.start,
                      style: context.theme.textTheme.labelMedium,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      verifyOTPDesc,
                      textAlign: TextAlign.start,
                      style: context.theme.textTheme.titleMedium?.copyWith(
                          color: context.theme.colorScheme.secondaryContainer),
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: OTPTextFormField(
                      textInputType: TextInputType.number,
                      onSubmitted: (String code) {},
                      onChanged: (String verificationCode) {},
                      onValidate: (value) {
                        return controller.validateOTP(value ?? '');
                      },
                      textEditController: controller.otpController,
                      focusNode: controller.otpFN,
                    ),
                  ),
                  SizedBox(
                    height: 55.h,
                  ),
                  CustomButton(
                    text: verifyOTP,
                    onTap: () {
                      controller.verifyOTP();
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Obx(() => Align(
                        alignment: AlignmentDirectional.center,
                        child: GestureDetector(
                          onTap: () => controller.resetTimer(),
                          child: Text(
                            controller.seconds.value != -1
                                ? '$resendOTP in 00:${(controller.seconds < 10) ? '0${controller.seconds}' : controller.seconds}'
                                : resendOTP,
                            textAlign: TextAlign.start,
                            style: context.theme.textTheme.bodySmall?.copyWith(
                                fontWeight: controller.seconds.value != -1
                                    ? FontWeight.normal
                                    : FontWeight.w600,
                                color: controller.seconds.value != -1
                                    ? context
                                        .theme.colorScheme.secondaryContainer
                                    : context
                                        .theme.colorScheme.primaryContainer),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
