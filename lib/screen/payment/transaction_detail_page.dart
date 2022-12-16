import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:office_booking_app/provider/reservation_provider.dart';
import 'package:office_booking_app/screen/components/appbar_component.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';
import 'package:office_booking_app/utils/constant/app_text_style.dart';
import 'package:provider/provider.dart';

class TransactionDetailPage extends StatefulWidget {
  const TransactionDetailPage({super.key});

  @override
  State<TransactionDetailPage> createState() => _TransactionDetailPageState();
}

class _TransactionDetailPageState extends State<TransactionDetailPage> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ReservationProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: const AppbarComponent(
          title: 'Booking Detail',
        ),
        body: Container(
          width: double.infinity,
          height: 450.h,
          margin: EdgeInsets.symmetric(vertical: 44.h, horizontal: 16.w),
          padding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 16.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.r)),
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  blurStyle: BlurStyle.normal,
                  blurRadius: 4.r,
                  color: const Color(0x40000000),
                  offset: const Offset(0, 2),
                )
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Transaksi',
                style: blackPaymentVeryLarge,
              ),
              SizedBox(
                height: 10.h,
              ),
              const Divider(
                color: AppColors.black,
                thickness: 1,
              ),
              SizedBox(
                height: 20.h,
              ),
              BookingTile(
                title: 'Transaction Date',
                subtitle: DateFormat('dd MMMM yyyy')
                    .format(DateFormat("yyyy-MM-dd")
                        .parse(data.getUserDetailReservation!.createdAt!))
                    .toString(),
              ),
              BookingTile(
                title: 'No Transaction',
                subtitle: data.getUserDetailReservation!.id!,
              ),
              BookingTile(
                title: 'No Virtual Account',
                subtitle: data.getPaymentBankData!.accountNumber.toString(),
              ),
              BookingTile(
                title: 'Payment Method',
                subtitle: 'Transfer Bank ${data.getPaymentBankData!.bankName}',
              ),
              BookingTile(
                title: 'Description',
                subtitle: data.getUserDetailReservation!.building!.name!,
              ),
              BookingTile(
                title: 'Start date',
                subtitle: DateFormat('dd MMMM yyyy')
                    .format(DateFormat("yyyy-MM-dd")
                        .parse(data.getUserDetailReservation!.startDate!))
                    .toString(),
              ),
              //belom
              BookingTile(
                title: 'Duration',
                subtitle:
                    '${data.getUserDetailReservation!.duration!.toString()} Month',
              ),

              SizedBox(
                height: 16.h,
              ),
              const Divider(),
              SizedBox(
                height: 16.h,
              ),
              BookingTile(
                title: 'Total Payment',
                subtitle:
                    'IDR ${data.getUserDetailReservation!.amount!.toString()}',
                isPrice: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookingTile extends StatelessWidget {
  const BookingTile(
      {Key? key, required this.title, required this.subtitle, this.isPrice})
      : super(key: key);
  final String title;
  final String subtitle;
  final bool? isPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 139.w,
            child: Text(
              title,
              style: isPrice == true ? blackPaymentMedium : greyPaymentSmall,
            ),
          ),
          SizedBox(
            width: 6.w,
          ),
          Expanded(
            child: SizedBox(
              width: 151.w,
              child: Text(
                subtitle,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: isPrice == true ? onboardSkip : null,
              ),
            ),
          )
        ],
      ),
    );
  }
}
