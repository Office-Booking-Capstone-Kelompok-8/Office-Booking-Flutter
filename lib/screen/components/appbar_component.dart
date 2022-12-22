import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constant/app_colors.dart';
import '../../utils/constant/app_text_style.dart';

class AppbarComponent extends StatelessWidget with PreferredSizeWidget {
  const AppbarComponent({super.key, required this.title, this.elevation});
  final String title;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 50.h,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          size: 25.sm,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      foregroundColor: AppColors.black,
      backgroundColor: AppColors.white,
      elevation: elevation ?? 1,
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
