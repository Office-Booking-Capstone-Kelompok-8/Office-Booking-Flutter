import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constant/app_text_style.dart';
import '../../utils/constant/app_colors.dart';

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
          backgroundColor: AppColors.buttonColor,
          alignment: Alignment.center,
          textStyle: buttonStyle,
          minimumSize: Size(buttonWidth, buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.w),
          ),
          foregroundColor: const Color(0xFF1E1E1E)),
      onPressed: onPress,
      child: isMessage == true
          ? const Icon(
              Icons.chat,
              size: 24,
            )
          : Text(
              textButton,
              style: buttonStyle,
            ),
    );
  }
}
