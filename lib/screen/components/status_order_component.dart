import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/utils/constant/app_text_style.dart';

import '../../utils/constant/app_colors.dart';

class StatusOrderComponent extends StatelessWidget {
  const StatusOrderComponent({super.key, required this.statusId});
  final int statusId;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8.h),
      margin: EdgeInsets.only(bottom: 8.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lily Meeting Room',
                    style: titleReservation,
                  ),
                  Text(
                    'Menteng (Jak-sel)',
                    style: formTop,
                  ),
                ],
              ),
              SizedBox(
                height: 35.h,
                width: 94.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    statusId == 1
                        ? Icon(
                            Icons.watch_later_outlined,
                            size: 16.sm,
                            color: AppColors.warning4,
                          )
                        : Icon(
                            Icons.receipt_long_outlined,
                            size: 16.sm,
                            color: AppColors.success4,
                          ),
                    statusId == 1
                        ? Text(
                            'pending',
                            style: TextStyle(
                              color: AppColors.warning4,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        : Text(
                            'success',
                            style: TextStyle(
                              color: AppColors.success4,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              SizedBox(
                  height: 82.h,
                  width: 82.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.network(
                          'https://img.freepik.com/premium-photo/modern-office-with-office-supplies-table-with-office-environment-background_67155-5307.jpg?w=2000'),
                    ),
                  )),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: SizedBox(
                  height: 82.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Mr. Robert', style: personReservation),
                      Text(
                        '16 Nov 2022\t\t\t -\t\t\t 16 Dec 2022',
                        style: dateReservation,
                      ),
                      Text(
                        'Rp 1.500.000',
                        style: titleReservation,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          const Divider(
            color: AppColors.neutral5,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
