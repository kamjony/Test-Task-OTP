import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:testtaskotp/common_widgets/elevated_button.dart';
import 'package:testtaskotp/common_widgets/icon_button.dart';
import 'package:testtaskotp/constants/color.dart';
import 'package:testtaskotp/constants/size_config.dart';
import 'package:testtaskotp/pages/sign_up/components/text_drop_down.dart';
import 'package:testtaskotp/pages/sign_up/sign_up_controller.dart';

class SignUpView extends StatelessWidget {
  final SignUpController _controller = Get.find();

  SignUpView({Key? key}) : super(key: key);

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
                const IconBtn(icon: Icons.arrow_back_ios),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 7,
                ),
                Center(
                    child: Text(
                  'Test Task',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: ColorUtils.greenColor),
                )),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 4.85,
                ),
                Text(
                  'Phone Number',
                  style: TextStyle(
                      color: ColorUtils.textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 1.85,
                ),
                Form(
                    key: _controller.numberFormKey,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ColorUtils.textBoxBorder),
                              color: ColorUtils.textBoxColor,
                              borderRadius: BorderRadius.circular(8)),
                          width: SizeConfig.blockSizeHorizontal! * 25,
                          child: Obx(() => DropdownButton(
                                value: _controller.dropDownValue.value,
                                icon: Icon(Icons.keyboard_arrow_down,
                                    color: ColorUtils.iconColor),
                                style: TextStyle(
                                    color: ColorUtils.inputText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                                underline: Container(),
                                items: _controller.items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  _controller.dropDownValue.value = newValue!;
                                },
                              )),
                        ),
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal! * 3.2,
                        ),
                        Expanded(
                          child: TextFormField(
                            maxLength: 10,
                            onSaved: (value) {
                              _controller.params['mobile'] = value!;
                            },
                            validator: (value) {
                              if (value!.length < 10) {
                                return 'Please input 10 digits';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            style: TextStyle(
                                color: ColorUtils.inputText,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            decoration: InputDecoration(
                              fillColor: ColorUtils.textBoxColor,
                              filled: true,
                              isDense: true,
                              counterText: '',
                              hintStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 14),
                              hintText: '1832584789',
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: ColorUtils.textBoxBorder),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: ColorUtils.textBoxBorder),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 5.3,
                ),
                Row(
                  children: [
                    Obx(() => Checkbox(
                        fillColor:
                            MaterialStateProperty.all(ColorUtils.greenColor),
                        value: _controller.checked.value,
                        onChanged: (val) {
                          _controller.checked.value = val!;
                        })),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: 'You agree to our ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: ColorUtils.textColor),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Terms & Conditions',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: ColorUtils.greenColor)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 2.2,
                ),
                ElevatedBtn(
                    label: 'Continue',
                    onPressed: () {
                      if (_controller.numberFormKey.currentState!.validate()) {
                        _controller.numberFormKey.currentState!.save();
                        if (_controller.checked.value) {
                          _controller.getOTP();
                        } else {
                          Get.snackbar('Error', 'Please accept terms & conditions');
                        }
                        // _controller.numberFormKey.currentState!.save();
                      }
                    }),

                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 5.3,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: ColorUtils.textColor),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Sign in',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.snackbar('SignIn', 'SignIn Page Not Implemented');
                              },
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: ColorUtils.greenColor)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
