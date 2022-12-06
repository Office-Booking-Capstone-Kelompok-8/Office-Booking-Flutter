import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showNotification(BuildContext context, String messages) {
  showTopSnackBar(
    Overlay.of(context)!,
    CustomSnackBar.info(
      backgroundColor: AppColors.primary4,
      icon: Icon(Icons.sentiment_neutral,
          color: const Color.fromARGB(40, 0, 0, 0), size: 60.w),
      maxLines: 2,
      message: messages,
      textStyle: TextStyle(fontSize: 12.sp, color: AppColors.white),
    ),
  );
}
