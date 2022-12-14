import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/screen/components/form_component.dart';
import '../../utils/constant/app_colors.dart';
import '../../utils/constant/app_text_style.dart';

class AppbarHome extends StatelessWidget with PreferredSizeWidget {
  const AppbarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Text(
          'Find best office around you',
          style: buildingName,
        ),
      ),
      backgroundColor: AppColors.white,
      elevation: 1,
      centerTitle: false,
      leading: null,
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              FormComponent(
                isPassword: false,
                isSearch: true,
                formHeight: 41.h,
                formWidth: double.infinity,
                onPress: () {
                  Navigator.pushNamed(context, '/search');
                },
              ),
              SizedBox(
                height: 8.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(110.h);
}
