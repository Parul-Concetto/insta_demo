import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../app_constants.dart';

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
      autovalidateMode: AutovalidateMode.disabled,
      obscuringCharacter: obSecureCharacter ?? '•',
      hintStyle: context.theme.textTheme.titleMedium
          ?.copyWith(color: context.theme.colorScheme.secondaryContainer),
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      length: otpLength ?? otpMaxLength,
      pinTheme: PinTheme(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 10)),
        shape: PinCodeFieldShape.box,
        activeColor: context.theme.colorScheme.onTertiaryContainer,
        activeFillColor: filledColor ?? context.theme.colorScheme.background,
        borderWidth: 1,
        fieldOuterPadding: const EdgeInsets.only(right: 12),
        disabledColor: context.theme.colorScheme.outline,
        errorBorderColor: context.theme.colorScheme.error,
        fieldWidth: boxWidth ?? 50,
        inactiveColor: context.theme.colorScheme.onTertiaryContainer,
        inactiveFillColor: filledColor ?? context.theme.colorScheme.background,
        selectedColor: context.theme.colorScheme.onTertiaryContainer,
        selectedFillColor: filledColor ?? context.theme.colorScheme.background,
        fieldHeight: boxWidth ?? 55,
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
            fillColor: widget.filledColor ?? context.theme.colorScheme.background,
            labelStyle: context.theme.textTheme.titleMedium,
            border: getBorder(
                context, context.theme.colorScheme.onTertiaryContainer, widget.isBorderEnabled,
                borderRadius: widget.borderRadius),
            enabledBorder: getBorder(
                context,
                context.theme.colorScheme.onTertiaryContainer,
                widget.isBorderEnabled,
                borderRadius: widget.borderRadius),
            disabledBorder: getBorder(
                context, context.theme.colorScheme.outline, widget.isBorderEnabled,
                borderRadius: widget.borderRadius),
            errorBorder: getBorder(
                context, context.theme.colorScheme.error, widget.isBorderEnabled,
                borderRadius: widget.borderRadius),
            focusedBorder: getBorder(
                context, context.theme.primaryColor, widget.isBorderEnabled,
                borderRadius: widget.borderRadius),
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
      borderRadius: BorderRadius.circular(borderRadius ?? 10),
      borderSide: BorderSide(
          color: (isBorderEnabled ?? true)
              ? borderColor
              : context.theme.colorScheme.background));
}
