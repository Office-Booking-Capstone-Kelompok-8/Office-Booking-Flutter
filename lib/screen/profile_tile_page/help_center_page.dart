import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/screen/components/appbar_component.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';
import 'package:office_booking_app/utils/constant/app_text_style.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppbarComponent(title: 'Help Center'),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  'Office Zone',
                  style: onboardTitle,
                ),
                SizedBox(
                  height: 13.h,
                ),
                Text(
                  'We help you find the right workspace for your business, downtown or close to home. Corporate workspaces, unique, luxury, or affordable. Whatever and wherever you need. We provide a variety of business class office spaces to accommodate your budget and business needs. No extra fees or incidentals.',
                  style: personReservation,
                ),
                SizedBox(
                  height: 14.h,
                ),
                Text(
                  'Contact information',
                  style: onboardTitle,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.phone_outlined,
                      color: AppColors.primary4,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      '0351 2345 678',
                      style: personReservation,
                    )
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.email_outlined,
                      color: AppColors.primary4,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      'officezone@mail.com',
                      style: personReservation,
                    )
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: AppColors.primary4,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      'Jl. Kenangan No. 99 Planet Mars',
                      style: personReservation,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
