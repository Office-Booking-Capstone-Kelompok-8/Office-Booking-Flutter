import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constant/app_colors.dart';
import '../../utils/constant/app_text_style.dart';

class AppbarComponent extends StatelessWidget with PreferredSizeWidget {
  const AppbarComponent({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 50.h,
      foregroundColor: AppColors.black,
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: titleAppBar,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
