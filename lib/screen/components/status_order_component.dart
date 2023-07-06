import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/utils/constant/app_text_style.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';

import '../../utils/constant/app_colors.dart';

class StatusOrderComponent extends StatelessWidget {
  const StatusOrderComponent(
      {super.key,
      required this.statusId,
      required this.roomName,
      required this.dateStart,
      required this.price,
      required this.imgUrl,
      required this.companyName,
      required this.monthDuration});
  final int statusId;
  final String roomName;
  final String dateStart;
  final String price;
  final String companyName;
  final String imgUrl;
  final int monthDuration;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.h),
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.dividerColor),
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SizedBox(
                  width: 160.w,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        roomName,
                        style: titleReservation,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        dateStart,
                        style: formTop,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: statusId == 1
                      ? const Color(0xFFFFF2DF)
                      : statusId == 2 || statusId == 3
                          ? const Color(0xFFFFE4E2)
                          : statusId == 4
                              ? const Color(0xFFE1EEFF)
                              : const Color(0xFFDFFFF0),
                ),
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
                  child: OptimizedCacheImage(
                    imageUrl: imgUrl,
                    filterQuality: FilterQuality.high,
                    height: 500,
                    width: 80,
                    fit: BoxFit.cover,
                    imageBuilder: (context, imageProvider) => Transform.scale(
                      filterQuality: FilterQuality.high,
                      scale: 1.4,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: imageProvider,
                          ),
                        ),
                      ),
                    ),
                    placeholder: (context, url) => const SizedBox(height: 100),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
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
                      Text(companyName, style: personReservation),
                      Text(
                        // 'Start $dateStart\t \u0387\ ${monthDuration.toString()} Month',
                        'Start $dateStart\t · 1 Month',
                        style: dateReservation,
                      ),
                      Row(
                        children: [
                          Text(
                            'Total ',
                            style: personReservation,
                          ),
                          Text(
                            price,
                            style: onboardSkip,
                          ),
                        ],
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
