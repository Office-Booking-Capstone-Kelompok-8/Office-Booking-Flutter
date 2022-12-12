import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/utils/constant/app_text_style.dart';
import '../../screen/components/appbar_component.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({super.key});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppbarComponent(title: 'Order Details'),
        body: Container(
          padding: EdgeInsets.fromLTRB(16.w, 26.h, 16.w, 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order Details #1234567876',
                style: idTransaction,
              ),
              SizedBox(
                height: 7.h,
              ),
              Text(
                'Lily Meeting Room',
                style: detailFormStyle,
              ),
              SizedBox(
                height: 28.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Check-in',
                        style: formTop,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        '18 Apr 2022',
                        style: dateOrder,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Check-out',
                        style: formTop,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        '18 Apr 2023',
                        style: dateOrder,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: Text(
                  'IDR 11.350.000',
                  style: priceOrder,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
