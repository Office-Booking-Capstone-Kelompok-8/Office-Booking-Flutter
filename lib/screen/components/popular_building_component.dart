import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';

class PopularBuildingComponent extends StatelessWidget {
  const PopularBuildingComponent(
      {super.key,
      required this.imgUrl,
      required this.buildingName,
      required this.city,
      required this.buildingPrice});
  final String imgUrl;
  final String buildingName;
  final String city;
  final String buildingPrice;

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
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4.r)),
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.network(
                imgUrl,
                height: 87.h,
                width: 80.w,
              ),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                buildingName,
                style: TextStyle(fontSize: 14.sp, color: AppColors.neutral9),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  Text(city,
                      style: TextStyle(
                          fontSize: 12.sp, color: AppColors.neutral8)),
                  SizedBox(
                    width: 8.w,
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Start from $buildingPrice',
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
