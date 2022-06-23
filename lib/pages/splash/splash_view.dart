import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testtaskotp/pages/splash/splash_controller.dart';

class SplashView extends StatelessWidget {
  final SplashController _controller = Get.find();

  SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: RotationTransition(
            turns: _controller.turnsTween.animate(_controller.animationController),
              child: Image.asset('assets/splash_softcent.png')),
        ),
      ),
    );
  }
}
