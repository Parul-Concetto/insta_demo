import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/strings.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../common/widgets/text_from_field_widget.dart';
import '../../forgot_password/views/widget/custom_back_button.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Form(
              key: controller.formKey,
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
                      resetPasswordTitle,
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
                      resetPasswordDesc,
                      textAlign: TextAlign.start,
                      style: context.theme.textTheme.titleMedium?.copyWith(
                          color: context.theme.colorScheme.secondaryContainer),
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  CustomTextField.password(
                    labelText: newPassword,
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.go,
                    textEditController: controller.passwordController,
                    focusNode: controller.passwordFN,
                    onSubmitted: (value) {},
                    onValidate: (String? textValue) =>
                        controller.validatePassword(textValue ?? ''),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  CustomTextField.password(
                    labelText: confirmPassword,
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.go,
                    textEditController: controller.confirmPasswordController,
                    focusNode: controller.confirmPasswordFN,
                    onSubmitted: (value) {},
                    onValidate: (String? textValue) =>
                        controller.confirmPasswordValidate(
                            controller.passwordController.value.text,
                            textValue ?? '',
                            confirmPassword),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  CustomButton(
                    text: resetPassword,
                    onTap: () {
                      controller.resetPassword();
                    },
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
