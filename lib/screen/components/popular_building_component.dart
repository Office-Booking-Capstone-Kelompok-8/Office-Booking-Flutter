import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';

class PopularBuildingComponent extends StatelessWidget {
  const PopularBuildingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.w),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.neutral2),
          borderRadius: BorderRadius.all(Radius.circular(8.r))),
      padding: EdgeInsets.all(8.h),
      child: Row(
        children: [
          Image.network(
            'https://www.barajacoding.or.id/wp-content/uploads/2022/05/unnamed.jpg',
            height: 87.h,
            width: 80.w,
          ),
          SizedBox(
            width: 8.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lily Meeting Me seRoom',
                style: TextStyle(fontSize: 14.sp, color: AppColors.neutral9),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text('South Jakarta',
                  style: TextStyle(fontSize: 12.sp, color: AppColors.neutral8)),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Start from 1.000.000',
                style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.primary5,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
