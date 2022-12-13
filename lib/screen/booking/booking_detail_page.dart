import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:office_booking_app/provider/reservation_provider.dart';
import 'package:office_booking_app/screen/components/appbar_component.dart';
import 'package:office_booking_app/screen/components/button_component.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';
import 'package:office_booking_app/utils/constant/app_text_style.dart';
import 'package:provider/provider.dart';

class BookingDetail extends StatefulWidget {
  const BookingDetail({super.key});

  @override
  State<BookingDetail> createState() => _BookingDetailState();
}

// int statusId = 1;

class _BookingDetailState extends State<BookingDetail> {
  @override
  Widget build(BuildContext context) {
    final detail = Provider.of<ReservationProvider>(context, listen: false);
    final int statusId = detail.getUserDetailReservation!.status!.id!;
    final dateBook = DateFormat("yyyy-MM-dd")
        .parse(detail.getUserDetailReservation!.createdAt!);
    final dateStart = DateFormat("yyyy-MM-dd")
        .parse(detail.getUserDetailReservation!.startDate!);
    final bookingDate = DateFormat('dd MMMM yyyy').format(dateBook);
    final startDate = DateFormat('dd MMMM yyyy').format(dateStart);

    return SafeArea(
        child: Scaffold(
      appBar: const AppbarComponent(title: 'Booking Detail'),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      blurStyle: BlurStyle.normal,
                      blurRadius: 24.r,
                      color: AppColors.shadowColor,
                      offset: const Offset(0, 8),
                    )
                  ],
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.fromLTRB(5.w, 11.h, 16.w, 11.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: SizedBox(
                        height: 90.h,
                        width: 90.w,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.network(
                            detail.getUserDetailReservation!.building!.picture!,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 18.w,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 92.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              detail.getUserDetailReservation!.building!.name!,
                              style: detailFormStyle,
                            ),
                            Text(
                              'Pancoran - South Jakarta',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: detailFormGrey,
                            ),
                            Row(
                              children: [
                                const Text('Price/month\t'),
                                Text(
                                  'IDR 1.000.000',
                                  style: onboardSkip,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              const Divider(),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                height: 24.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Information details', style: blackBooking),
                    Container(
                      color: statusId == 1
                          ? const Color(0xFFFFF2DF)
                          : statusId == 2 || statusId == 3
                              ? const Color(0xFFFFE4E2)
                              : statusId == 4
                                  ? const Color(0xFFE1EEFF)
                                  : const Color(0xFFDFFFF0),
                      height: 24.h,
                      width: statusId == 4 ? 145.w : 94.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          statusId == 1
                              ? Icon(
                                  Icons.watch_later_outlined,
                                  size: 16.sm,
                                  color: AppColors.warning4,
                                )
                              : statusId == 2
                                  ? Icon(
                                      Icons.cancel_outlined,
                                      size: 16.sm,
                                      color: AppColors.error4,
                                    )
                                  : statusId == 3
                                      ? Icon(
                                          Icons.cancel_outlined,
                                          size: 16.sm,
                                          color: AppColors.error4,
                                        )
                                      : statusId == 4
                                          ? Icon(
                                              Icons.attach_money_outlined,
                                              size: 16.sm,
                                              color: AppColors.primary4,
                                            )
                                          : Icon(
                                              Icons.check_circle_outline,
                                              size: 16.sm,
                                              color: AppColors.success4,
                                            ),
                          statusId == 1
                              ? Text(
                                  'Pending',
                                  style: TextStyle(
                                    color: AppColors.warning4,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              : statusId == 2
                                  ? Text(
                                      'Rejected',
                                      style: TextStyle(
                                        color: AppColors.error4,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  : statusId == 3
                                      ? Text(
                                          'Canceled',
                                          style: TextStyle(
                                            color: AppColors.error4,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      : statusId == 4
                                          ? Text(
                                              'Awaiting Payment',
                                              style: TextStyle(
                                                color: AppColors.primary4,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          : statusId == 5
                                              ? Text(
                                                  'Active',
                                                  style: TextStyle(
                                                    color: AppColors.success4,
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )
                                              : Text(
                                                  'Completed',
                                                  style: TextStyle(
                                                    color: AppColors.success4,
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              BookingDetailTile(
                  leading: 'Company name',
                  trailing: detail.getUserDetailReservation!.companyName!),
              SizedBox(
                height: 8.h,
              ),
              //  BookingDetailTile(
              //     leading: 'Tenant name', trailing: detail.getUserDetailReservation!.companyName!),
              // SizedBox(
              //   height: 8.h,
              // ),
              BookingDetailTile(
                  leading: 'Booking date ', trailing: bookingDate),
              SizedBox(
                height: 8.h,
              ),
              BookingDetailTile(leading: 'Start date ', trailing: startDate),
              SizedBox(
                height: 16.h,
              ),
              const Divider(),
              SizedBox(
                height: 16.h,
              ),
              Text('Pricing details', style: blackBooking),
              SizedBox(
                height: 16.h,
              ),
              BookingDetailTile(leading: 'Duration', trailing: '3 Month'),
              SizedBox(
                height: 8.h,
              ),
              BookingDetailTile(
                  leading: 'Price/month', trailing: 'IDR 1.000.000'),
              SizedBox(
                height: 16.h,
              ),
              const Divider(),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: blackBooking,
                  ),
                  Text(
                    'IDR 3.000.000',
                    style: onboardSkip,
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 37.h,
        margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
        //status pending
        child: statusId == 1
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonComponent(
                      onPress: () {},
                      isRed: true,
                      isWhite: false,
                      textButton: 'cancel',
                      buttonHeight: 37.h,
                      buttonWidth: 156.w),
                  ButtonComponent(
                      onPress: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/navbar', (route) => false);
                      },
                      textButton: 'Back to home',
                      buttonHeight: 37.h,
                      buttonWidth: 156.w),
                ],
              )
            //status rejected & canceled
            : statusId == 2 || statusId == 3
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonComponent(
                          onPress: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/navbar', (route) => false);
                          },
                          isRed: false,
                          isWhite: true,
                          textButton: 'Back to Home',
                          buttonHeight: 37.h,
                          buttonWidth: 156.w),
                      ButtonComponent(
                          onPress: () {
                            Navigator.pushNamed(context, '/search');
                          },
                          textButton: 'Order Again',
                          buttonHeight: 37.h,
                          buttonWidth: 156.w),
                    ],
                  )

                //status awaiting payment
                : statusId == 4
                    ? ButtonComponent(
                        onPress: () {
                          Navigator.pushNamed(context, '/payment-detail');
                        },
                        textButton: 'Complete Payment',
                        buttonHeight: 37.h,
                        buttonWidth: double.infinity)
                    : //status active & complete
                    ButtonComponent(
                        onPress: () {},
                        textButton: 'Give Review',
                        buttonHeight: 37.h,
                        buttonWidth: double.infinity),
      ),
    ));
  }
}

class BookingDetailTile extends StatelessWidget {
  const BookingDetailTile({
    Key? key,
    required this.leading,
    required this.trailing,
  }) : super(key: key);
  final String leading;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(leading), Text(trailing)],
    );
  }
}
