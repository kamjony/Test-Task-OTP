import 'package:get/get.dart';
import 'package:testtaskotp/pages/otp_verify/otp_verify_controller.dart';

class OTPVerifyBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<OTPVerifyController>(OTPVerifyController());
  }

}