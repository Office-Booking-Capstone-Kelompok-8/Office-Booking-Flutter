import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constant/app_colors.dart';

// ignore: must_be_immutable
class TileCompnent extends StatelessWidget {
  TileCompnent({
    Key? key,
    required this.text,
    this.onPress,
    this.textColor = AppColors.neutral8,
    this.height = 40,
  }) : super(key: key);

  final Function()? onPress;
  final String text;
  Color textColor;
  double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Column(
        children: [
          SizedBox(
            height: height.h,
            child: ListTile(
              title: Text(
                text,
                style: TextStyle(fontSize: 14.sp, color: textColor),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.black,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: const Divider(
              color: AppColors.text1,
              // thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
