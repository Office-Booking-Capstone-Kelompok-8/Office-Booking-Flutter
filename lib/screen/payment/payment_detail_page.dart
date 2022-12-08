import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';
import 'package:office_booking_app/utils/constant/app_text_style.dart';
import '../components/appbar_component.dart';

class PaymentDetailPage extends StatefulWidget {
  const PaymentDetailPage({super.key});

  @override
  State<PaymentDetailPage> createState() => _PaymentDetailPageState();
}

class _PaymentDetailPageState extends State<PaymentDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppbarComponent(title: 'Payment Detail'),
        body: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurStyle: BlurStyle.normal,
                    blurRadius: 4.r,
                    color: const Color(0x40000000),
                    offset: const Offset(0, 2),
                  )
                ],
                color: AppColors.white,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
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
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    padding: EdgeInsets.fromLTRB(10.w, 0.h, 10.w, 16.h),
                    width: double.infinity,
                    height: 92.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Rincian transaksi',
                              style: blackPaymentLarge,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text('View Detail'))
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'No. Transaksi',
                              style: greyPaymentMedium,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              '322B07INA55',
                              style: blackPaymentSmall,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const Divider(),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                    child: SizedBox(
                      height: 248.h,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: CircleAvatar(
                                  backgroundImage: const NetworkImage(
                                      'https://unsplash.com/photos/OLLtavHHBKg/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8M3x8aWNvbiUyMHBlcnNvbnxlbnwwfDJ8fHwxNjcwMjE3NjIz&force=true&w=640'),
                                  radius: 20.r,
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                'BRI',
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'No Virtual Account',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10.w),
                            decoration: BoxDecoration(
                                color: AppColors.neutral3,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.r))),
                            height: 38.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '4444 8864 7821 9327',
                                  style: blackPaymentMedium,
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.copy,
                                      size: 24.sm,
                                      color: const Color(0xFF323232),
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            'Total Pembayaran',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10.w),
                            decoration: BoxDecoration(
                                color: AppColors.neutral3,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.r))),
                            height: 38.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Rp 2.099.000',
                                  style: blackPaymentMedium,
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.copy,
                                      size: 24.sm,
                                      color: const Color(0xFF323232),
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Center(
                            child:
                                Text('Hanya menerima transfer dari bank BRI'),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            const Divider(),
            Container(
              padding: EdgeInsets.all(16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Petunjuk transfer',
                    style: blackPaymentLarge,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  const Divider(
                    color: AppColors.black,
                    height: 0.2,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  ExpansionTile(
                    expandedAlignment: Alignment.topLeft,
                    title: const Text('Mobile Banking BRI'),
                    children: [
                      const Text(
                          '1.Masuk ke menu Mobile Banking BRI. Kemudian, pilih Pembayaran > BRIVA.'),
                      Row(
                        children: [
                          const Text('2.Masukkan Nomor BRIVA '),
                          const Text('4444 8864 7821 9327.')
                        ],
                      ),
                      const Text(
                          '3. Masukkan PIN Anda kemudian pilih Send. Apabila pesan konfirmasi untuk transaksi menggunakan SMS muncul, pilih OK. Status transaksi akan dikirimkan melalui SMS dan dapat digunakan sebagai bukti pembayaran.'),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
