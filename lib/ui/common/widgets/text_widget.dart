import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonText extends StatelessWidget {
  const CommonText(
      {Key? key,
      this.text,
      this.size,
      this.fontFamily,
      this.textColor,
      this.fontWeight,
      this.textAlign})
      : super(key: key);
  final String? text;
  final double? size;
  final String? fontFamily;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      textAlign: textAlign,
      style: TextStyle(
        fontSize: size,
        fontFamily: fontFamily ?? context.textTheme.labelMedium?.fontFamily,
        color: textColor,
        fontWeight: fontWeight,
      ),
    );
  }
}
