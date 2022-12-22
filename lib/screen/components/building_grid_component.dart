import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constant/app_colors.dart';

class BuildingGridComponent extends StatelessWidget {
  const BuildingGridComponent({
    Key? key,
    required this.url,
    required this.buildingName,
    required this.buildingLoc,
    required this.buildingPrice,
    this.onPress,
    this.rating,
  }) : super(key: key);

  final String url;
  final String buildingName;
  final String buildingLoc;
  final String buildingPrice;
  final Function()? onPress;
  final double? rating;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                SizedBox(
                  height: 110.w,
                  width: 180.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r)),
                    child: Image.network(
                      url,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (rating!.toStringAsFixed(0) != '0')
                  Container(
                    height: 20.w,
                    width: 35.w,
                    margin: EdgeInsets.all(8.w),
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
                    decoration: BoxDecoration(
                      color: AppColors.primary4,
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.r),
                      ),
                    ),
                    child: Text(
                      rating!.toStringAsFixed(1),
                      style:
                          TextStyle(fontSize: 12.sp, color: AppColors.neutral2),
                    ),
                  ),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          buildingName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.neutral9,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          buildingLoc,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 12.sp, color: AppColors.neutral8),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                      ],
                    ),
                    Text(
                      'Start From $buildingPrice',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.primary5,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
