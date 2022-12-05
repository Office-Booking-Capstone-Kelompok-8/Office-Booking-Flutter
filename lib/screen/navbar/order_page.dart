import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/screen/components/button_component.dart';
import 'package:office_booking_app/screen/components/status_order_component.dart';
import 'package:office_booking_app/utils/constant/app_text_style.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

bool _isEmpty = false;

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _isEmpty == true
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 98.h,
                        width: 98.w,
                        child:
                            Image.asset('assets/images/reservation_empty.png')),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      'Oops!! There are no active orders',
                      style: detailFormStyle,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    ButtonComponent(
                        onPress: () {},
                        textButton: 'explore',
                        buttonHeight: 37.h,
                        buttonWidth: 214.w)
                  ],
                ),
              )
            : Container(
                padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 10.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Reservation',
                        style: onboardTitle,
                      ),
                      SizedBox(height: 16.h),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/order-detail');
                        },
                        child: const StatusOrderComponent(
                          statusId: 1,
                        ),
                      ),
                      const StatusOrderComponent(
                        statusId: 2,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
