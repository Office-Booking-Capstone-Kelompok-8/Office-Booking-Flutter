// ignore_for_file: use_build_context_synchronously

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:office_booking_app/provider/filter_provider.dart';
import 'package:office_booking_app/provider/reservation_provider.dart';
import 'package:office_booking_app/screen/components/appbar_component.dart';
import 'package:office_booking_app/screen/components/button_component.dart';
import 'package:office_booking_app/screen/components/show_state.dart';
import 'package:office_booking_app/screen/components/snackbar_component.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';
import 'package:office_booking_app/utils/constant/app_text_style.dart';
import 'package:office_booking_app/utils/constant/helper.dart';
import 'package:provider/provider.dart';

class BookingDetail extends StatefulWidget {
  const BookingDetail({super.key});

  @override
  State<BookingDetail> createState() => _BookingDetailState();
}

class _BookingDetailState extends State<BookingDetail> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ReservationProvider>(context, listen: false)
          .getPaymentAllBank();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final detail = Provider.of<ReservationProvider>(context, listen: true);
    final int statusId = detail.getUserDetailReservation!.status!.id!;
    final dateBook = DateFormat("yyyy-MM-dd")
        .parse(detail.getUserDetailReservation!.createdAt!);
    final dateStart = DateFormat("yyyy-MM-dd")
        .parse(detail.getUserDetailReservation!.startDate!);
    final bookingDate = DateFormat('dd MMMM yyyy').format(dateBook);
    final startDate = DateFormat('dd MMMM yyyy').format(dateStart);

    return Scaffold(
      appBar: const AppbarComponent(
        title: 'Booking Detail',
        elevation: 0,
      ),
      body: Container(
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
                              "${detail.getUserDetailReservation!.building!.district!}-${detail.getUserDetailReservation!.building!.city}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: detailFormGrey,
                            ),
                            Row(
                              children: [
                                Text(
                                  Helper.convertToIdr(
                                          detail.getUserDetailReservation!
                                                  .amount! ~/
                                              detail.getUserDetailReservation!
                                                  .duration!,
                                          0,
                                          true)
                                      .toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: onboardSkip,
                                ),
                                const Text(' /month'),
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
              BookingDetailTile(
                  leading: 'Booking date ', trailing: bookingDate),
              SizedBox(
                height: 8.h,
              ),
              BookingDetailTile(leading: 'Start date ', trailing: startDate),
              SizedBox(
                height: 8.h,
              ),
              BookingDetailTile(
                  leading: 'Duration',
                  trailing:
                      '${detail.getUserDetailReservation!.duration!} Month'),
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
              BookingDetailTile(
                  leading: 'Price',
                  trailing: Helper.convertToIdr(
                          detail.getUserDetailReservation!.amount! ~/
                              detail.getUserDetailReservation!.duration!,
                          0,
                          true)
                      .toString()),
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
                    Helper.convertToIdr(
                        detail.getUserDetailReservation!.amount!, 0, true),
                    style: onboardSkip,
                  ),
                ],
              ),
              statusId == 4 ? SizedBox(height: 16.h) : const SizedBox(),
              statusId == 4 ? const Divider() : const SizedBox(),
              statusId == 4 ? SizedBox(height: 16.h) : const SizedBox(),
              statusId == 4
                  ? Text('Payment Method', style: blackBooking)
                  : const SizedBox(),
              statusId == 4 ? SizedBox(height: 16.h) : const SizedBox(),
              statusId == 4
                  ? Consumer2<FilterProvider, ReservationProvider>(
                      builder: (context, provider, reservation, child) =>
                          SizedBox(
                        height: 41.h,
                        width: double.infinity,
                        child: DropDownTextField(
                          textFieldDecoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(top: 12.h, left: 16.w),
                            hintText: 'Select Payment Method',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: const BorderSide(
                                width: 1,
                                color: AppColors.borderButton,
                              ),
                            ),
                          ),
                          listSpace: 20,
                          listPadding: ListPadding(top: 20),
                          validator: (value) {
                            if (value == null) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownList: List.generate(
                              growable: true,
                              reservation.getAllBank.length,
                              (index) => DropDownValueModel(
                                  name: reservation.getAllBank[index].bankName!,
                                  value: reservation.getAllBank[index].id)),
                          dropDownItemCount: reservation.getAllBank.length,
                          onChanged: (val) {
                            if (val != null &&
                                val.runtimeType == DropDownValueModel) {
                              provider.changeDuration(val.value);
                            }
                          },
                        ),
                      ),
                    )
                  : const SizedBox(),
              SizedBox(
                height: 16.h,
              ),
              const Divider(),
              if (detail.commentReviewed != null)
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    Text('Review', style: blackBooking),
                    SizedBox(
                      height: 8.h,
                    ),
                    BookingDetailTile(
                      leading: 'Posted',
                      trailing: detail.commentReviewed!.createdAt!.toString(),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Rating'),
                        Row(
                          children: [
                            RatingBarIndicator(
                              rating:
                                  detail.commentReviewed!.review!.toDouble(),
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 14.0,
                              direction: Axis.horizontal,
                            ),
                            Text(
                                '(${detail.commentReviewed!.review!.toString()})')
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    BookingDetailTile(
                      leading: 'Comment',
                      trailing: detail.commentReviewed!.comment! == ""
                          ? '---'
                          : detail.commentReviewed!.comment!,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Consumer2<ReservationProvider, FilterProvider>(
        builder: (context, value, filter, _) {
          if (value.commentReviewed == null) {
            return Container(
              height: 37.h,
              margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
              //status pending
              child: statusId == 1
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonComponent(
                            onPress: () async {
                              showDialogApp(
                                context: context,
                                title: 'Cancel Reservation',
                                subtitle:
                                    'Are you sure you want to cancel this reservation? This acction cannot be undone',
                                buttonTextRight: 'Keep Booking',
                                redLeft: true,
                                onPressLeft: () async {
                                  try {
                                    final result =
                                        await value.cancelReservation(value
                                            .getUserDetailReservation!.id!);
                                    if (result ==
                                        'Reservation canceled successfully') {
                                      showNotification(context, result!);
                                    } else if (result != null) {
                                      showNotification(context, result);
                                    }
                                    Navigator.popAndPushNamed(
                                        context, '/navbar');
                                  } catch (e) {
                                    showNotification(context, e.toString());
                                  }
                                },
                              );
                            },
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
                              onPress: () async {
                                try {
                                  final result = await value
                                      .getPaymentBank(filter.duration!);

                                  if (value.getPaymentBankData?.id != null) {
                                    filter.changeDuration(0);
                                    Navigator.pushNamed(
                                        context, '/payment-detail');
                                  } else if (result != null) {
                                    showNotification(context, result);
                                  } else {
                                    showNotification(
                                        context, 'Choose Payment Method');
                                  }
                                } catch (e) {
                                  showNotification(context, e.toString());
                                }
                              },
                              textButton: 'Complete Payment',
                              buttonHeight: 37.h,
                              buttonWidth: double.infinity)
                          : //status active & complete
                          ButtonComponent(
                              onPress: () {
                                Navigator.pushNamed(context, '/post-review');
                              },
                              textButton: 'Give Review',
                              buttonHeight: 37.h,
                              buttonWidth: double.infinity),
            );
          } else {
            return const SizedBox(
              height: 1,
            );
          }
        },
      ),
    );
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
