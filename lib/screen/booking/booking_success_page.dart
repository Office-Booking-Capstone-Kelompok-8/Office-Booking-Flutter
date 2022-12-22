import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/provider/navbar_provider.dart';
import 'package:office_booking_app/screen/components/button_component.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';
import 'package:provider/provider.dart';

class BookingSuccessPage extends StatelessWidget {
  const BookingSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Booking Success',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24.sp,
                  color: AppColors.primary4,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 24.h,
            ),
            Image.asset(
              'assets/images/success.png',
              height: 172.h,
              width: 160.w,
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              'Please check your order list periodically to see if the status has been received by the admin or not',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.sp),
            ),
            SizedBox(
              height: 48.h,
            ),
            Consumer<NavbarProvider>(
              builder: (context, navbar, _) => ButtonComponent(
                  onPress: () {
                    navbar.currentTab = 1;
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/navbar', (route) => false);
                  },
                  textButton: 'View Reservation List',
                  buttonHeight: 37.h,
                  buttonWidth: double.infinity),
            ),
            SizedBox(
              height: 16.h,
            ),
            Consumer<NavbarProvider>(
              builder: (context, navbar, _) => ButtonComponent(
                  onPress: () {
                    navbar.currentTab = 0;
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/navbar', (route) => false);
                  },
                  textButton: 'Back to Home',
                  buttonHeight: 37.h,
                  isWhite: true,
                  buttonWidth: double.infinity),
            ),
          ],
        ),
      ),
    ));
  }
}
