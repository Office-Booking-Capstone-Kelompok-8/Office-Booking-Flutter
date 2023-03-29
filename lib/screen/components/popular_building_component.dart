import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';

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
    return Card(
      elevation: 1,
      child: Container(
        margin: EdgeInsets.only(right: 8.w),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.neutral2),
            borderRadius: BorderRadius.all(Radius.circular(8.r))),
        padding: EdgeInsets.all(8.h),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(6.r)),
              child: OptimizedCacheImage(
                imageUrl: imgUrl,
                filterQuality: FilterQuality.low,
                height: 100,
                width: 80,
                fit: BoxFit.cover,
                imageBuilder: (context, imageProvider) => Transform.scale(
                    scale: 1.4,
                    child: Container(
                        decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: imageProvider,
                      ),
                    ))),
                placeholder: (context, url) => const SizedBox(height: 100),
                errorWidget: (context, url, error) => const Icon(Icons.error),
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
                  height: 8.w,
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
      ),
    );
  }
}
