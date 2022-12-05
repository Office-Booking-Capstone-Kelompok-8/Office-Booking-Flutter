import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constant/app_colors.dart';

class BuildingGridComponent extends StatelessWidget {
  const BuildingGridComponent(
      {Key? key,
      required this.url,
      required this.buildingName,
      required this.buildingLoc,
      required this.buildingPrice,
      this.onPress})
      : super(key: key);

  final String url;
  final String buildingName;
  final String buildingLoc;
  final String buildingPrice;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120.h,
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
            Container(
              height: 85.w,
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        buildingName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 14.sp, color: AppColors.neutral9),
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
            )
          ],
        ),
      ),
    );
  }
}
