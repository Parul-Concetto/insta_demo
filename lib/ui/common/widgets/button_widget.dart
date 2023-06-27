import 'package:flutter/material.dart';
import 'package:get/get.dart';

//TODO: Change custom button design as per your requirements
class CustomButton extends StatelessWidget {
  final Color? bgColor;
  final String text;
  final EdgeInsets? padding;
  final VoidCallback onTap;

  const CustomButton(
      {Key? key,
      this.bgColor,
      required this.text,
      this.padding,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: padding ?? const EdgeInsets.all(10),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    bgColor ?? context.theme.colorScheme.primary),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0))),
              ),
              onPressed: () => onTap.call(),
              child: Text(
                text,
                style: context.theme.textTheme.titleLarge
                    ?.copyWith(color: Colors.white),
              ),
            ),
          )),
    );
  }
}
