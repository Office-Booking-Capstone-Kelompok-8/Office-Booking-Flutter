import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:office_booking_app/utils/state/finite_state.dart';

import '../../utils/constant/app_colors.dart';

void showState(dynamic provider, {dynamic provider2}) {
  if (provider2 == null) {
    if (provider.myState == MyState.loading) {
      SmartDialog.showLoading();
    } else if (provider.myState == MyState.failed) {
      SmartDialog.dismiss();
      SmartDialog.show(builder: (context) {
        return Container(
          height: 100.w,
          width: 180.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: const Text('Gagal', style: TextStyle(color: AppColors.error5)),
        );
      });
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
