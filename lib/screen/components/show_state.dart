import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:office_booking_app/utils/state/finite_state.dart';

import '../../utils/constant/app_colors.dart';

void showState(dynamic provider) {
  if (provider.myState == MyState.loading) {
    SmartDialog.show(builder: (context) {
      return Container(
        height: 150.w,
        width: 150.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(
                color: AppColors.primary4,
              ),
              SizedBox(
                height: 20.h,
              ),
              const Text('Loading...',
                  style: TextStyle(color: AppColors.primary4)),
            ],
          ),
        ),
      );
    });
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
  } else {
    SmartDialog.dismiss();
  }
}
