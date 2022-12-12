import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:office_booking_app/provider/reservation_provider.dart';
import 'package:office_booking_app/screen/components/button_component.dart';
import 'package:office_booking_app/screen/components/status_order_component.dart';
import 'package:office_booking_app/utils/constant/app_text_style.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ReservationProvider>(context, listen: false).getReservation();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final reservation =
        Provider.of<ReservationProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: reservation.getUserReservation.isEmpty == true
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
                          Navigator.pushNamed(context, '/booking-detail');
                        },
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: reservation.getUserReservation.length,
                          itemBuilder: (context, index) {
                            final date = DateFormat("yyyy-MM-dd").parse(
                                reservation
                                    .getUserReservation[index].startDate!);
                            String dateParse =
                                DateFormat('dd MMM yyyy').format(date);
                            return StatusOrderComponent(
                              companyName: reservation
                                  .getUserReservation[index].companyName!,
                              dateStart: dateParse,
                              imgUrl: reservation
                                  .getUserReservation[index].building!.picture!,
                              roomName: reservation
                                  .getUserReservation[index].building!.name!,
                              statusId: reservation
                                  .getUserReservation[index].status!.id!,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
