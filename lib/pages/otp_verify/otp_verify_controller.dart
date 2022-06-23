import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:testtaskotp/data/api.dart';

class OTPVerifyController extends GetxController{
  String? otp;
  String? phoneNumber;
  RxBool timeOut = RxBool(false);
  late TextEditingController otpController;

  @override
  void onInit() {
    otp = Get.arguments[0].toString();
    phoneNumber = Get.arguments[1];
    otpController = TextEditingController();

    super.onInit();
  }

  @override
  void onReady() {
    if (otp != null) {
      Get.snackbar('Your OTP', otp!);
    }
    super.onReady();
  }

  void checkOTP() {
    if (otpController.text == otp) {
      Get.snackbar('Success', 'OTP Matched');
    } else {
      Get.snackbar('Failed', 'OTP Mismatch');
    }
  }

  void resendOTP() async {
    var result = await api.requestOtp();
    if (result != null) {
      Get.snackbar('Your New OTP', result.data['otp_code'].toString());
    }
  }

  String getMinuteString(int decimalValue) {
    int minutes = decimalValue~/60;
    int seconds = (decimalValue%60);
    String timeToShow = minutes.toString().padLeft(2,"0")+":"+seconds.toString().padLeft(2,"0");
    return timeToShow;
  }
}