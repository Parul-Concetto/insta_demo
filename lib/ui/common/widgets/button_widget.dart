import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_demo/ui/common/widgets/text_widget.dart';

//TODO: Change custom button design as per your requirements
class CustomButton extends StatelessWidget {
  final Color? bgColor;
  final String? text;
  final EdgeInsets? padding;
  final Color? textColor;
  final VoidCallback onTap;
  final String? prefixIcon;
  final bool isIconVisible;
  final double? width;
  final double? height;

  const CustomButton(
      {Key? key,
      this.bgColor,
      this.text,
      this.padding,
      required this.onTap,
      this.textColor,
      this.prefixIcon,
      this.width,
      this.height,
      this.isIconVisible = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h),
        child: Container(
          alignment: Alignment.center,
          height: height ?? 60.h,
          width: width ?? Get.width,
          decoration: BoxDecoration(
            color: bgColor ?? context.theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isIconVisible)
                Image.asset(
                  prefixIcon ?? '',
                  height: 30.h,
                  width: 30.h,
                ),
              CommonText(
                text: text ?? '',
                size: 14.sp,
                fontFamily: context.theme.textTheme.labelSmall?.fontFamily,
                fontWeight: FontWeight.w500,
                textColor:
                    textColor ?? context.theme.colorScheme.primaryContainer,
              ),
            ],
          ),
        ),
      ),
    );

    /*Center(
      child: Padding(
          padding: padding ?? const EdgeInsets.all(10),
          child: SizedBox(
            height: 60.h,
            width: double.infinity,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      bgColor ?? context.theme.colorScheme.secondary),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14))),
                ),
                onPressed: () => onTap.call(),
                child: CommonText(
                  text: text,
                  size: 14.sp,
                  textColor:
                      textColor ?? context.theme.colorScheme.primaryContainer,
                )),
          )),
    );*/
  }
}
