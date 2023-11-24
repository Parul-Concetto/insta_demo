import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommonLinkText extends StatelessWidget {
  const CommonLinkText({
    Key? key,
    required this.label,
    required this.onTap,
    this.fontSize,
    this.textAlign,
    this.padding,
  }) : super(key: key);

  final String label;
  final VoidCallback onTap;
  final double? fontSize;
  final TextAlign? textAlign;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(),
      child: Text(
        label,
        style: Get.theme.textTheme.labelMedium?.copyWith(
          color: context.theme.disabledColor,
          fontFamily: context.theme.textTheme.labelSmall?.fontFamily,
          fontSize: fontSize ?? 13.sp,
        ),
        textAlign: textAlign ?? TextAlign.center,
      ),
    );
  }
}
