import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/strings.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../common/widgets/text_from_field_widget.dart';
import '../controllers/forgot_password_controller.dart';
import 'widget/custom_back_button.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);

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
                      forgotPasswordTitle,
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
                      forgotPasswordDesc,
                      textAlign: TextAlign.start,
                      style: context.theme.textTheme.titleMedium?.copyWith(
                          color: context.theme.colorScheme.secondaryContainer),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  CustomTextField(
                    labelText: emailOrMobile,
                    textInputType: TextInputType.text,
                    textEditController: controller.emailController,
                    focusNode: controller.emailFN,
                    onValidate: (String? textValue) =>
                        controller.emptyValidate(textValue ?? '', emailOrMobile),
                  ),
                  SizedBox(
                    height: 65.h,
                  ),
                  CustomButton(
                    text: sendOTP,
                    onTap: () {
                      controller.sendOTP();
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
