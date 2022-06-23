import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:testtaskotp/data/api.dart';

class SignUpController extends GetxController{

  final numberFormKey = GlobalKey<FormState>();
  Map<String, String> params = {};

  // Initial Selected Value
  RxString dropDownValue = RxString('+880');
  RxBool checked = RxBool(false);

  // List of items in our dropdown menu
  var items = [
    '+880',
    '+1',
    '+44',
    '+61',
  ];

  void getOTP() async {

    String phoneNumber = dropDownValue.value + params['mobile']!;

    var result = await api.requestOtp();
    if (result != null) {
      Get.toNamed('/otp_verify', arguments: [result.data['otp_code'].toString(), phoneNumber]);
    }
  }

}