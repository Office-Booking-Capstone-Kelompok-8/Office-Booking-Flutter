import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent(
      {super.key,
      required this.onPress,
      required this.textButton,
      required this.buttonHeight,
      required this.buttonWidth,
      this.isMessage});
  final Function() onPress;
  final String textButton;
  final double buttonHeight;
  final double buttonWidth;
  final bool? isMessage;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          alignment: Alignment.center,
          textStyle: TextStyle(fontSize: 14.sp),
          minimumSize: Size(buttonWidth, buttonHeight),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.w))),
      onPressed: onPress,
      child: isMessage == true
          ? const Icon(
              Icons.chat,
              size: 24,
            )
          : Text(
              textButton,
            ),
    );
  }
}
