import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:testtaskotp/common_widgets/elevated_button.dart';
import 'package:testtaskotp/common_widgets/icon_button.dart';
import 'package:testtaskotp/constants/color.dart';
import 'package:testtaskotp/constants/size_config.dart';
import 'package:testtaskotp/pages/otp_verify/otp_verify_controller.dart';

class OTPVerifyView extends StatelessWidget {
  final OTPVerifyController _controller = Get.find();

  OTPVerifyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 30, 24, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const IconBtn(icon: Icons.close),
                Center(child: Image.asset('assets/otp_image.png')),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 1.85,
                ),
                Center(
                  child: Text(
                    'Verification Code',
                    style: TextStyle(
                        color: ColorUtils.verificationTitle,
                        fontWeight: FontWeight.w500,
                        fontSize: 32),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 0.86,
                ),
                Center(
                  child: Text(
                    'Please type the code we sent to',
                    style: TextStyle(
                        color: ColorUtils.textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 0.80,
                ),
                Center(
                  child: Text(
                    _controller.phoneNumber ?? '0',
                    style: TextStyle(
                        color: ColorUtils.textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 4.1,
                ),
                PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: TextStyle(
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 5,
                  obscureText: true,
                  animationType: AnimationType.fade,
                  // hintCharacter: '*',
                  obscuringWidget: Image.asset('assets/loading.gif'),

                  textStyle: TextStyle(
                      color: ColorUtils.textColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w400),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(4),
                    fieldHeight: SizeConfig.blockSizeVertical! * 6.65,
                    fieldWidth: SizeConfig.blockSizeHorizontal! * 13.33,
                    inactiveFillColor: ColorUtils.textBoxColor,
                    inactiveColor: ColorUtils.textBoxColor,
                    selectedColor: ColorUtils.textBoxColor,
                    activeFillColor: ColorUtils.textBoxColor,
                    activeColor: ColorUtils.textBoxColor,
                    selectedFillColor: ColorUtils.textBoxColor,
                  ),
                  cursorColor: Colors.black,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  controller: _controller.otpController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onCompleted: (v) {
                    // _controller.checkOtpCode();

                  },
                  onChanged: (v) {

                  },
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 4.3,
                ),

                Obx(()=>!_controller.timeOut.value ? TweenAnimationBuilder(
                  tween: Tween(begin: 120.0, end: 0),
                  duration: const Duration(seconds: 120),
                  builder: (context, value, child) {
                    double val = value as double;
                    int time = val.toInt();
                    return Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Code Sent. Try again in ",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: ColorUtils.textColor),
                          children: <TextSpan>[
                            TextSpan(
                                text: _controller.getMinuteString(time),
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: ColorUtils.greenColor)),
                          ],
                        ),
                      ),
                    );
                  },
                  onEnd: () {
                    _controller.timeOut.value = true;
                  },
                ) : Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Resend ",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: ColorUtils.textColor),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'OTP',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                _controller.resendOTP();
                              },
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: ColorUtils.greenColor)),
                      ],
                    ),
                  ),
                )),

                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 3.3,
                ),
                ElevatedBtn(
                    label: 'Next',
                    onPressed: () {
                      _controller.checkOTP();
                    }),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
