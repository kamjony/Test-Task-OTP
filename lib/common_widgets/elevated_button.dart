import 'package:flutter/material.dart';
import 'package:testtaskotp/constants/color.dart';
import 'package:testtaskotp/constants/size_config.dart';

class ElevatedBtn extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const ElevatedBtn({Key? key, required this.label, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: SizeConfig.blockSizeVertical! * 5.65,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 5,
            padding: const EdgeInsets.all(10),
            primary: ColorUtils.greenColor,
            shape: const StadiumBorder()),
        child: Text(
          label,
          style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w500),
        ),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}
