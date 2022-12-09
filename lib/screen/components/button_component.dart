import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constant/app_colors.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent(
      {super.key,
      required this.onPress,
      required this.textButton,
      required this.buttonHeight,
      required this.buttonWidth,
      this.isMessage,
      this.isWhite});
  final Function() onPress;
  final String textButton;
  final double buttonHeight;
  final double buttonWidth;
  final bool? isMessage;
  final bool? isWhite;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor:
              isWhite == true ? AppColors.white : AppColors.primary4,
          side: const BorderSide(width: 1, color: AppColors.borderButton),
          alignment: Alignment.center,
          textStyle: TextStyle(
            color: isWhite == true ? AppColors.primary4 : AppColors.neutral2,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
          minimumSize: Size(buttonWidth, buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.w),
          ),
          foregroundColor: AppColors.borderButton),
      onPressed: onPress,
      child: isMessage == true
          ? const Icon(
              Icons.chat,
              size: 24,
            )
          : Text(
              textButton,
              style: TextStyle(
                color:
                    isWhite == true ? AppColors.primary4 : AppColors.neutral2,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
    );
  }
}
