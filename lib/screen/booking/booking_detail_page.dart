import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/screen/components/appbar_component.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';
import 'package:office_booking_app/utils/constant/app_text_style.dart';

class BookingDetail extends StatefulWidget {
  const BookingDetail({super.key});

  @override
  State<BookingDetail> createState() => _BookingDetailState();
}

int statusId = 1;

class _BookingDetailState extends State<BookingDetail> {
  @override
  Widget build(BuildContext context) {
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
                            'https://img.freepik.com/premium-photo/modern-office-with-office-supplies-table-with-office-environment-background_67155-5307.jpg?w=2000',
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
                              'Lily Meeting Room',
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
                                  'pending',
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
                                        color: AppColors.warning4,
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
              const BookingDetailTile(
                  leading: 'Company name', trailing: 'Alterra Academy'),
              SizedBox(
                height: 8.h,
              ),
              const BookingDetailTile(
                  leading: 'Tenant name', trailing: 'Mr. Robert'),
              SizedBox(
                height: 8.h,
              ),
              const BookingDetailTile(
                  leading: 'Booking date ', trailing: '16 November 2022'),
              SizedBox(
                height: 8.h,
              ),
              const BookingDetailTile(
                  leading: 'Start date ', trailing: '26 November 2022'),
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
              const BookingDetailTile(leading: 'Duration', trailing: '3 Month'),
              SizedBox(
                height: 8.h,
              ),
              const BookingDetailTile(
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
      // bottomNavigationBar: Container(
      //   height: 70.h,
      //   margin: EdgeInsets.all(16.h),
      //   child: statusId == 1 ||,
      // ),
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
