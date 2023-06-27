import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/colors_assets.dart';
import '../../../common/strings.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../common/widgets/text_from_field_widget.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController>{
  const RegisterView({Key? key}) : super(key: key);

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
                      registerTitle,
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
                      registerDesc,
                      textAlign: TextAlign.start,
                      style: context.theme.textTheme.titleMedium?.copyWith(
                          color: context.theme.colorScheme.secondaryContainer),
                    ),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  CustomTextField(
                    labelText: firstName,
                    textInputType: TextInputType.text,
                    textEditController: controller.firstNameController,
                    focusNode: controller.firstNameFN,
                    onValidate: (String? textValue) =>
                        controller.validateName(textValue ?? '', firstName),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  CustomTextField(
                    labelText: lastName,
                    textInputType: TextInputType.text,
                    textEditController: controller.lastNameController,
                    focusNode: controller.lastNameFN,
                    onValidate: (String? textValue) =>
                        controller.validateName(textValue ?? '', lastName),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  CustomTextField(
                    labelText: mobile,
                    textInputType: TextInputType.phone,
                    textEditController: controller.mobileController,
                    focusNode: controller.mobileFN,
                    onValidate: (String? textValue) =>
                        controller.validateMobile(textValue ?? ''),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  CustomTextField(
                    labelText: email,
                    textInputType: TextInputType.emailAddress,
                    textEditController: controller.emailController,
                    focusNode: controller.emailFN,
                    onValidate: (String? textValue) =>
                        controller.validateEmail(textValue ?? ''),
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
                        controller.validatePassword(textValue ?? ''),
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                  CustomButton(
                    text: register,
                    onTap: () {
                      controller.registerUser();
                    },
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                 const SignIn(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}

class SignIn extends StatelessWidget {
  const SignIn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      text: alreadyHaveAccount,
      style: context.theme.textTheme.titleMedium,
      children: <TextSpan>[
        TextSpan(
          text: signIn,
          recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
          style: context.theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800, color: LightThemeColors.primaryColor),
        ),
      ],
    ));
  }
}
