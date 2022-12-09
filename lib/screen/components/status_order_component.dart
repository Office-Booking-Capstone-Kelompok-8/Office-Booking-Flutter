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
      padding: EdgeInsets.all(8.h),
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.dividerColor),
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 160.w,
                child: Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lily Meeting Room',
                        style: titleReservation,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        '16 Nov 2022',
                        style: formTop,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: statusId == 1
                    ? const Color(0xFFFFF2DF)
                    : statusId == 2 || statusId == 3
                        ? const Color(0xFFFFE4E2)
                        : statusId == 4
                            ? const Color(0xFFE1EEFF)
                            : const Color(0xFFDFFFF0),
                height: 24.h,
                width: statusId == 4 ? 145.w : 94.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    statusId == 1
                        ? Icon(
                            Icons.watch_later_outlined,
                            size: 16.sm,
                            color: AppColors.warning4,
                          )
                        : statusId == 2
                            ? Icon(
                                Icons.cancel_outlined,
                                size: 16.sm,
                                color: AppColors.error4,
                              )
                            : statusId == 3
                                ? Icon(
                                    Icons.cancel_outlined,
                                    size: 16.sm,
                                    color: AppColors.error4,
                                  )
                                : statusId == 4
                                    ? Icon(
                                        Icons.attach_money_outlined,
                                        size: 16.sm,
                                        color: AppColors.primary4,
                                      )
                                    : statusId == 5
                                        ? Icon(
                                            Icons.visibility_outlined,
                                            size: 16.sm,
                                            color: AppColors.success4,
                                          )
                                        : Icon(
                                            Icons.check_circle_outline,
                                            size: 16.sm,
                                            color: AppColors.success4,
                                          ),
                    statusId == 1
                        ? Text(
                            'Pending',
                            style: TextStyle(
                              color: AppColors.warning4,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : statusId == 2
                            ? Text(
                                'Rejected',
                                style: TextStyle(
                                  color: AppColors.error4,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            : statusId == 3
                                ? Text(
                                    'Canceled',
                                    style: TextStyle(
                                      color: AppColors.error4,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                : statusId == 4
                                    ? Text(
                                        'Awaiting Payment',
                                        style: TextStyle(
                                          color: AppColors.primary4,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    : statusId == 5
                                        ? Text(
                                            'Active',
                                            style: TextStyle(
                                              color: AppColors.success4,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        : Text(
                                            'Completed',
                                            style: TextStyle(
                                              color: AppColors.success4,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
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
          const Divider(
            color: AppColors.dividerColor,
            thickness: 1,
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
            height: 8.h,
          ),
        ],
      ),
    );
  }
}
