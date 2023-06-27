import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_demo/routes/app_pages.dart';

import '../../../common/colors_assets.dart';
import '../../../common/strings.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../common/widgets/text_from_field_widget.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

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
                    height: 100.h,
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      loginTitle,
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
                      loginDesc,
                      textAlign: TextAlign.start,
                      style: context.theme.textTheme.titleMedium
                          ?.copyWith(color: context.theme.colorScheme.secondaryContainer),
                    ),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  CustomTextField(
                    labelText: email,
                    textInputType: TextInputType.emailAddress,
                    textEditController: controller.emailController,
                    focusNode: controller.emailFN,
                    onValidate: (String? textValue) =>
                        controller.emptyValidate(textValue ?? '', email),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  CustomTextField.password(
                    labelText: password,
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.go,
                    textEditController: controller.passwordController,
                    focusNode: controller.passwordFN,
                    onSubmitted: (value) {},
                    onValidate: (String? textValue) =>
                        controller.emptyValidate(textValue ?? '', password),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const ForgotPassword(),
                  SizedBox(
                    height: 55.h,
                  ),
                  CustomButton(
                    text: login,
                    onTap: () {
                      controller.verifyLogin();
                    },
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  const SignUp(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      text: dontHaveAccount,
      style: context.theme.textTheme.titleMedium,
      children: <TextSpan>[
        TextSpan(
          text: signUp,
          recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(Routes.REGISTER),
          style: context.theme.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.w800, color: LightThemeColors.primaryColor),
        ),
      ],
    ));
  }
}

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: InkWell(
        onTap: () => Get.toNamed(Routes.FORGOT_PASSWORD),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            forgotPassword,
            textAlign: TextAlign.start,
            style: context.theme.textTheme.titleMedium
                ?.copyWith(color: context.theme.colorScheme.primaryContainer),
          ),
        ),
      ),
    );
  }
}
