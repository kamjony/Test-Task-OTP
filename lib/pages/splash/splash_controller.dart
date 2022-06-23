import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:testtaskotp/constants/size_config.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Tween<double> turnsTween;

  @override
  void onInit() {
    SizeConfig().init(Get.context);

    turnsTween = Tween<double>(
      begin: 0,
      end: 1,
    );
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat();

    Future.delayed(const Duration(seconds: 2))
        .then((value) => Get.offNamed('/sign_up'));

    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
