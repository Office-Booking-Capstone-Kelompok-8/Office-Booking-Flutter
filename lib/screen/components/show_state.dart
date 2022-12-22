import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:office_booking_app/screen/components/button_component.dart';
import 'package:office_booking_app/utils/state/finite_state.dart';

import '../../utils/constant/app_colors.dart';

void showState(dynamic provider, {dynamic provider2}) {
  if (provider2 == null) {
    if (provider.myState == MyState.loading) {
      SmartDialog.showLoading();
    } else if (provider.myState == MyState.failed) {
      SmartDialog.dismiss();
      SmartDialog.show(
        builder: (context) {
          return Container(
            height: 100.w,
            width: 180.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: const Text(
              'Something Wrong',
              style: TextStyle(color: AppColors.error5),
            ),
          );
        },
        clickMaskDismiss: false,
        backDismiss: false,
      );
    } else if (provider.myState == MyState.loaded) {
      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
    }
  } else {
    if (provider.myState == MyState.loading ||
        provider2.myState == MyState.loading) {
      SmartDialog.showLoading();
    } else if (provider.myState == MyState.failed ||
        provider.myState == MyState.failed) {
      SmartDialog.dismiss();
      SmartDialog.show(
        builder: (context) {
          return Container(
            height: 100.w,
            width: 180.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Something Error',
                  style: TextStyle(
                    color: AppColors.error5,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Check Internet Connection',
                  style: TextStyle(
                    color: AppColors.error5,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
        clickMaskDismiss: false,
        backDismiss: false,
      );
    } else if (provider.myState == MyState.loaded) {
      SmartDialog.dismiss();
    } else {
      SmartDialog.dismiss();
    }
  }
}

showDialogApp({
  required BuildContext context,
  required String title,
  required String subtitle,
  String? buttonTextLeft,
  String? buttonTextRight,
  Function()? onPressRight,
  Function()? onPressLeft,
  bool redLeft = false,
  bool redRigh = false,
}) {
  SmartDialog.show(
    builder: (ctx) {
      return Container(
        padding: EdgeInsets.all(16.w),
        height: 140.w,
        width: 310.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              subtitle,
              style: TextStyle(
                color: AppColors.neutral9,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ButtonComponent(
                      isRed: redLeft,
                      onPress: onPressLeft ??
                          () {
                            SmartDialog.dismiss();
                          },
                      textButton: buttonTextLeft ?? 'Cancel',
                      buttonHeight: 37.w,
                      buttonWidth: double.infinity,
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child: ButtonComponent(
                      isRed: redRigh,
                      onPress: onPressRight ??
                          () {
                            SmartDialog.dismiss();
                          },
                      textButton: buttonTextRight ?? 'Cancel',
                      buttonHeight: 37.w,
                      buttonWidth: double.infinity,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    },
    clickMaskDismiss: false,
  );
}
