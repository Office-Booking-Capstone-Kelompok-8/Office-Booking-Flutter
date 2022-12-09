import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/screen/components/appbar_component.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';
import 'package:office_booking_app/utils/constant/app_text_style.dart';

class TransactionDetailPage extends StatefulWidget {
  const TransactionDetailPage({super.key});

  @override
  State<TransactionDetailPage> createState() => _TransactionDetailPageState();
}

class _TransactionDetailPageState extends State<TransactionDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppbarComponent(
          title: 'Booking Detail',
        ),
        body: Container(
          width: double.infinity,
          height: 429.h,
          margin: EdgeInsets.symmetric(vertical: 44.h, horizontal: 16.w),
          padding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 16.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.r)),
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  blurStyle: BlurStyle.normal,
                  blurRadius: 20.r,
                  color: const Color(0x40000000),
                  offset: const Offset(0, 2),
                )
              ]),
          child: Column(
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
              const BookingTile(
                title: 'No Transaksi',
                subtitle: '322B07INA55',
              ),
              const BookingTile(
                title: 'No Virtual Accout',
                subtitle: '4444 8864 7821 9327',
              ),
              const BookingTile(
                title: 'Tgl. Transaksi',
                subtitle: '10-05-2021',
              ),
              const BookingTile(
                title: 'Durasi',
                subtitle: '1 Tahun',
              ),
              const BookingTile(
                title: 'Metode Pembayaran',
                subtitle: 'Transfer Bank BRI',
              ),
              const BookingTile(
                title: 'Total Bayar',
                subtitle: 'Rp 11.350.000',
              ),
              const BookingTile(
                title: 'Keterangan',
                subtitle: 'Booking Lily Meeting Room',
              ),
              const BookingTile(
                title: 'Chek-in',
                subtitle: '18 April 2022',
              ),
              const BookingTile(
                title: 'Chek-out',
                subtitle: '18 April 2023',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookingTile extends StatelessWidget {
  const BookingTile({Key? key, required this.title, required this.subtitle})
      : super(key: key);
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: SizedBox(
        child: Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 139.w,
                child: Text(
                  title,
                  style: greyPaymentSmall,
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              SizedBox(
                width: 151.w,
                child: Text(
                  subtitle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
