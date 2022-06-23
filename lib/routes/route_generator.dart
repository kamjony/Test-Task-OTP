import 'package:get/get.dart';
import 'package:testtaskotp/pages/otp_verify/otp_verify_binding.dart';
import 'package:testtaskotp/pages/otp_verify/otp_verify_view.dart';
import 'package:testtaskotp/pages/sign_up/sign_up_binding.dart';
import 'package:testtaskotp/pages/sign_up/sign_up_view.dart';
import 'package:testtaskotp/pages/splash/splash_binding.dart';
import 'package:testtaskotp/routes/route.dart';

import '../pages/splash/splash_view.dart';

class RouteGenerator{
  static final List<GetPage> routes = [
    GetPage(
        name: Routes.SPLASH,
        binding: SplashBinding(),
        page: () => SplashView(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.SIGNUP,
        binding: SignUpBinding(),
        page: () => SignUpView(),
        transition: Transition.noTransition,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: Routes.OTPVERIFY,
        binding: OTPVerifyBinding(),
        page: () => OTPVerifyView(),
        transition: Transition.noTransition,
        transitionDuration: const Duration(milliseconds: 500)),
  ];
}