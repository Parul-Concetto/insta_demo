import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundBackButton extends StatelessWidget {
  const RoundBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: InkWell(
        onTap: () => Get.back(),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.theme.primaryColor,
          ),
          child:
              const Icon(Icons.chevron_left, size: 45, color: Colors.white),
        ),
      ),
    );
  }
}
