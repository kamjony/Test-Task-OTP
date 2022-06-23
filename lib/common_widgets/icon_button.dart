import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:testtaskotp/constants/color.dart';

class IconBtn extends StatelessWidget {
  final IconData icon;

  const IconBtn({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
          padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
          decoration: BoxDecoration(
              border: Border.all(color: ColorUtils.backBtnBorder),
              borderRadius: BorderRadius.circular(16)),
          child: Icon(icon, size: 18, color: ColorUtils.iconColor)),
    );
  }
}
