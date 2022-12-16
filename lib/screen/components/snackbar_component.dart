import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showNotification(BuildContext context, String messages) {
  showTopSnackBar(
    Overlay.of(context)!,
    Container(
      height: 50.h,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
          color: (messages.toLowerCase().contains('succes'))
              ? const Color(0xFF4caf52)
              : AppColors.error4,
          borderRadius: BorderRadius.circular(8.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (messages.toLowerCase().contains('succes'))
              ? Icon(
                  Icons.check_circle_outline,
                  color: AppColors.white,
                  size: 20.w,
                )
              : Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.white),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    Icons.close_rounded,
                    size: 14.w,
                    color: AppColors.white,
                  ),
                ),
          SizedBox(
            width: 6.w,
          ),
          Flexible(
            child: Text(
              messages,
              style: TextStyle(fontSize: 14.sp, color: AppColors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
    displayDuration: const Duration(seconds: 2),
    animationDuration: const Duration(milliseconds: 900),
    dismissType: DismissType.onTap,
  );
}
