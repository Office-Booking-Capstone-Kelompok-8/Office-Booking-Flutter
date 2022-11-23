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
            borderRadius: BorderRadius.circular(10.w),
          ),
          backgroundColor: const Color(0xFFD9D9D9),
          foregroundColor: const Color(0xFF1E1E1E)),
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
