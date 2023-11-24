import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_demo/ui/common/strings.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../app_constants.dart';

class CommonMobileTextField extends StatefulWidget {
  const CommonMobileTextField({
    Key? key,
    this.onChanged,
    this.onSubmitted,
    this.onValidate,
    this.borderRadius,
    required this.textEditController,
    required this.focusNode,
    required this.textInputType,
    this.textInputAction,
    required this.labelText,
    this.filledColor,
    this.isFilled,
    this.isBorderEnabled,
    this.onSaved,
  }) : super(key: key);

  final ValueChanged<PhoneNumber>? onChanged;
  final ValueChanged<PhoneNumber>? onSaved;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<bool>? onValidate;
  final double? borderRadius;
  final TextEditingController textEditController;
  final FocusNode focusNode;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final String labelText;
  final Color? filledColor;
  final bool? isFilled;
  final bool? isBorderEnabled;

  @override
  State<CommonMobileTextField> createState() => _CommonMobileTextFieldState();
}

class _CommonMobileTextFieldState extends State<CommonMobileTextField> {
  PhoneNumber initialCountryCode = PhoneNumber(isoCode: 'US');

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      textFieldController: widget.textEditController,
      focusNode: widget.focusNode,
      cursorColor: context.theme.colorScheme.primaryContainer,
      onInputChanged: (PhoneNumber number) => widget.onChanged?.call(number),
      onFieldSubmitted: (value) => widget.onSubmitted?.call(value),
      onSaved: (PhoneNumber number) => widget.onSaved?.call(number),
      ignoreBlank: false,
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.DROPDOWN,
        setSelectorButtonAsPrefixIcon: true,
        leadingPadding: 4,
        trailingSpace: false,
        showFlags: true,
      ),
      initialValue: initialCountryCode,
      selectorButtonOnErrorPadding: 20.w,
      searchBoxDecoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(40.w, 36.h, 40.w, 36.h),
        labelText: searchHere,
        filled: widget.isFilled ?? true,
        fillColor:
            widget.filledColor ?? context.theme.colorScheme.primaryContainer,
        labelStyle: context.theme.textTheme.titleSmall?.copyWith(
          fontFamily: context.theme.textTheme.labelSmall?.fontFamily,
          fontSize: 14.sp,
          color: context.theme.colorScheme.primaryContainer,
          fontWeight: FontWeight.w400,
        ),
        border: getBorder(
          context,
          context.theme.colorScheme.onTertiaryContainer,
          false,
          borderRadius: widget.borderRadius,
        ),
        enabledBorder: getBorder(
          context,
          context.theme.colorScheme.onTertiaryContainer,
          false,
          borderRadius: widget.borderRadius,
        ),
        disabledBorder: getBorder(
          context,
          context.theme.colorScheme.outline,
          widget.isBorderEnabled,
          borderRadius: widget.borderRadius,
        ),
        errorBorder: getBorder(
          context,
          context.theme.colorScheme.error,
          widget.isBorderEnabled,
          borderRadius: widget.borderRadius,
        ),
        focusedBorder: getBorder(
          context,
          context.theme.dividerColor,
          widget.isBorderEnabled,
          borderRadius: widget.borderRadius,
        ),
      ),
      selectorTextStyle: context.theme.textTheme.titleSmall?.copyWith(
        fontFamily: context.theme.textTheme.labelSmall?.fontFamily,
        fontSize: 14.sp,
        color: context.theme.colorScheme.primaryContainer,
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w400,
        height: 2.0.h,
      ),
      autoValidateMode: AutovalidateMode.always,
      onInputValidated: (bool value) => widget.onValidate?.call(value),
      spaceBetweenSelectorAndTextField: 25.w,
      countrySelectorScrollControlled: true,
      textStyle: context.theme.textTheme.titleSmall?.copyWith(
        fontFamily: context.theme.textTheme.labelSmall?.fontFamily,
        fontSize: 14.sp,
        color: context.theme.colorScheme.primaryContainer,
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w400,
      ),
      inputDecoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(40.w, 10.h, 40.w, 10.h),
        labelText: widget.labelText,
        filled: widget.isFilled ?? true,
        fillColor:
            widget.filledColor ?? context.theme.colorScheme.primaryContainer,
        labelStyle: context.theme.textTheme.titleSmall?.copyWith(
          fontFamily: context.theme.textTheme.labelSmall?.fontFamily,
          fontSize: 14.sp,
          color: context.theme.colorScheme.primaryContainer,
          fontWeight: FontWeight.w400,
        ),
        border: getBorder(
          context,
          context.theme.colorScheme.onTertiaryContainer,
          false,
          borderRadius: widget.borderRadius,
        ),
        enabledBorder: getBorder(
          context,
          context.theme.colorScheme.onTertiaryContainer,
          false,
          borderRadius: widget.borderRadius,
        ),
        disabledBorder: getBorder(
          context,
          context.theme.colorScheme.outline,
          widget.isBorderEnabled,
          borderRadius: widget.borderRadius,
        ),
        errorBorder: getBorder(
          context,
          context.theme.colorScheme.error,
          widget.isBorderEnabled,
          borderRadius: widget.borderRadius,
        ),
        focusedBorder: getBorder(
          context,
          context.theme.dividerColor,
          widget.isBorderEnabled,
          borderRadius: widget.borderRadius,
        ),
      ),
    );
  }
}

class OTPTextFormField extends StatelessWidget {
  const OTPTextFormField(
      {Key? key,
      this.otpLength,
      this.isObSecure,
      this.textInputType,
      this.filledColor,
      this.borderRadius,
      required this.onChanged,
      required this.onSubmitted,
      this.mainAxisAlignment,
      this.boxWidth,
      this.onValidate,
      required this.textEditController,
      required this.focusNode,
      this.obSecureCharacter})
      : super(key: key);
  final TextEditingController textEditController;
  final FocusNode focusNode;
  final int? otpLength;
  final bool? isObSecure;
  final TextInputType? textInputType;
  final Color? filledColor;
  final double? borderRadius;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final FormFieldValidator<String>? onValidate;
  final MainAxisAlignment? mainAxisAlignment;
  final double? boxWidth;
  final String? obSecureCharacter;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: textEditController,
      focusNode: focusNode,
      hintCharacter: '0',
      autoDisposeControllers: false,
      autovalidateMode: AutovalidateMode.disabled,
      obscuringCharacter: obSecureCharacter ?? '•',
      hintStyle: context.theme.textTheme.titleMedium
          ?.copyWith(color: context.theme.colorScheme.secondaryContainer),
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
      length: otpLength ?? otpMaxLength,
      pinTheme: PinTheme(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 10)),
        shape: PinCodeFieldShape.box,
        activeColor: context.theme.colorScheme.primaryContainer,
        activeFillColor: filledColor ?? context.theme.colorScheme.primaryContainer,
        borderWidth: 1,
        disabledColor: context.theme.colorScheme.outline,
        errorBorderColor: context.theme.colorScheme.error,
        fieldWidth: boxWidth ?? 30,
        inactiveColor: context.theme.colorScheme.primaryContainer,
        inactiveFillColor: filledColor ?? context.theme.colorScheme.primaryContainer,
        selectedColor: context.theme.colorScheme.primaryContainer,
        selectedFillColor: filledColor ?? context.theme.colorScheme.primaryContainer,
        fieldHeight: boxWidth ?? 35,
      ),
      keyboardType: textInputType ?? TextInputType.number,
      obscureText: isObSecure ?? false,
      textStyle: context.theme.textTheme.titleMedium,
      appContext: context,
      validator: onValidate,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }
}

//TODO:Change text field design as per your ui requirement
class CustomTextField extends StatefulWidget {
  final TextEditingController textEditController;
  final FocusNode focusNode;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final String labelText;
  final Color? filledColor;
  final bool? isFilled;
  final bool? isBorderEnabled;
  final bool? isRequired;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final String? Function(String?)? onValidate;
  final double? borderRadius;
  final bool isPassword;

  const CustomTextField(
      {Key? key,
      required this.textEditController,
      required this.focusNode,
      this.textInputAction,
      required this.textInputType,
      required this.labelText,
      this.isFilled,
      this.filledColor,
      this.onChanged,
      this.isRequired,
      this.onSubmitted,
      this.borderRadius,
      required this.onValidate,
      this.isBorderEnabled})
      : isPassword = false,
        super(key: key);

  const CustomTextField.password(
      {Key? key,
      required this.textEditController,
      required this.focusNode,
      this.textInputAction,
      required this.textInputType,
      required this.labelText,
      this.isFilled,
      this.filledColor,
      this.onChanged,
      this.isRequired,
      this.onSubmitted,
      this.borderRadius,
      required this.onValidate,
      this.isBorderEnabled})
      : isPassword = true,
        super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passwordHide = true;

  void _toggleVisibility() => setState(() => passwordHide = !passwordHide);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.textEditController,
        focusNode: widget.focusNode,
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        keyboardType: widget.textInputType,
        autocorrect: true,
        obscureText: widget.isPassword ? passwordHide : false,
        style: context.theme.textTheme.titleMedium,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
            labelText: widget.labelText,
            filled: widget.isFilled ?? true,
            fillColor: widget.filledColor ?? context.theme.colorScheme.primary,
            labelStyle: context.theme.textTheme.titleMedium,
            border: getBorder(
                context,
                context.theme.colorScheme.onTertiaryContainer,
                widget.isBorderEnabled,
                borderRadius: widget.borderRadius),
            enabledBorder: getBorder(
                context,
                context.theme.colorScheme.onTertiaryContainer,
                widget.isBorderEnabled,
                borderRadius: widget.borderRadius),
            disabledBorder: getBorder(context,
                context.theme.colorScheme.outline, widget.isBorderEnabled,
                borderRadius: widget.borderRadius),
            errorBorder: getBorder(context, context.theme.colorScheme.error,
                widget.isBorderEnabled,
                borderRadius: widget.borderRadius),
            focusedBorder: getBorder(
              context,
              context.theme.colorScheme.secondaryContainer,
              true,
              borderRadius: widget.borderRadius,
            ),
            suffixIcon: widget.isPassword
                ? Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: IconButton(
                      icon: Icon(passwordHide
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: _toggleVisibility,
                    ),
                  )
                : null),
        onFieldSubmitted: widget.onSubmitted,
        onChanged: widget.onChanged,
        validator: widget.onValidate);
  }
}

getBorder(BuildContext context, Color borderColor, bool? isBorderEnabled,
    {double? borderRadius}) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 14),
      borderSide: BorderSide(
          color: (isBorderEnabled ?? true)
              ? borderColor
              : context.theme.colorScheme.secondaryContainer));
}
