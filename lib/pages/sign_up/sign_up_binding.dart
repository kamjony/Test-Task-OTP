import 'package:get/get.dart';
import 'package:testtaskotp/pages/sign_up/sign_up_controller.dart';

class SignUpBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<SignUpController>(SignUpController());
  }

}