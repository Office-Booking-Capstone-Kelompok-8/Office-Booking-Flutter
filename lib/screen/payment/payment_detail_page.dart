import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:office_booking_app/provider/reservation_provider.dart';
import 'package:office_booking_app/screen/components/button_component.dart';
import 'package:office_booking_app/screen/components/snackbar_component.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';
import 'package:office_booking_app/utils/constant/app_text_style.dart';
import 'package:office_booking_app/utils/constant/helper.dart';
import 'package:provider/provider.dart';
import '../components/appbar_component.dart';

class PaymentDetailPage extends StatefulWidget {
  const PaymentDetailPage({super.key});

  @override
  State<PaymentDetailPage> createState() => _PaymentDetailPageState();
}

ValueNotifier<File?> fileImage = ValueNotifier<File?>(null);

class _PaymentDetailPageState extends State<PaymentDetailPage> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ReservationProvider>(context, listen: false);
    return SafeArea(
      child: ValueListenableBuilder(
        valueListenable: fileImage,
        builder: (context, value, _) => Scaffold(
          appBar: const AppbarComponent(title: 'Payment Detail'),
          body: ListView(
            children: [
              SizedBox(
                height: 24.h,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                height: 33.h,
                decoration: BoxDecoration(
                    color: AppColors.info1,
                    borderRadius: BorderRadius.all(Radius.circular(5.r))),
                child: Text(
                  'Complete transaction before ${DateFormat('dd MMMM yyyy').format(DateFormat("yyyy-MM-dd").parse(data.getUserDetailReservation!.expiredAt!)).toString()}',
                  style: TextStyle(color: AppColors.primary5, fontSize: 13.sp),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
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
                                'Transaction details',
                                style: blackPaymentMedium,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/transaction-detail');
                                  },
                                  child: const Text('View Detail'))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Transaction ID',
                                style: greyPaymentMedium,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Flexible(
                                flex: 4,
                                child: Text(
                                  data.getUserDetailReservation!.id.toString(),
                                  style: blackPaymentSmall,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Flexible(
                                flex: 4,
                                child: SizedBox(
                                  height: 28.h,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.copy,
                                      size: 16.sm,
                                    ),
                                  ),
                                ),
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
                        height: 324.h,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 20.r,
                                    child: SvgPicture.network(
                                        data.getPaymentBankData!.bankIcon!),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  data.getPaymentBankData!.bankName!,
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Account Number',
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    data.getPaymentBankData!.accountNumber
                                        .toString(),
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
                              'Account Name',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 7.h, horizontal: 10.w),
                              decoration: BoxDecoration(
                                  color: AppColors.neutral3,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.r))),
                              height: 38.h,
                              width: double.infinity,
                              child: Text(
                                data.getPaymentBankData!.accountName!,
                                style: blackPaymentMedium,
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
                              padding: EdgeInsets.symmetric(
                                  vertical: 7.h, horizontal: 10.w),
                              decoration: BoxDecoration(
                                  color: AppColors.neutral3,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.r))),
                              height: 38.h,
                              width: double.infinity,
                              child: Text(
                                'Rp ${Helper.convertToIdr(data.getUserDetailReservation!.amount!, 0, false).toString()}',
                                style: blackPaymentMedium,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Center(
                              child:
                                  Text(data.getPaymentBankData!.description!),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                height: 165.h,
                padding: EdgeInsets.all(16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Upload Payment Evidence',
                      style: blackPaymentMedium,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    (value != null)
                        ? Center(
                            child: Text(
                            value.path.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ))
                        : Container(
                            height: 48.h,
                            decoration: BoxDecoration(
                              color: AppColors.neutral4,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.r)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.image),
                                TextButton(
                                    style: TextButton.styleFrom(
                                        splashFactory: NoSplash.splashFactory),
                                    onPressed: () async {
                                      final result = await FilePicker.platform
                                          .pickFiles(type: FileType.image);
                                      if (result == null) return;
                                      // Mendapatkan file yang telah di pick
                                      final PlatformFile file =
                                          result.files.first;
                                      // Membuka file terpilih
                                      fileImage.value =
                                          File(file.path.toString());
                                    },
                                    child: const Text('Choose')),
                                const Text('your images here')
                              ],
                            ),
                          ),
                    SizedBox(
                      height: 8.h,
                    ),
                    value != null
                        ? Center(
                            child: TextButton(
                                style: TextButton.styleFrom(
                                    splashFactory: NoSplash.splashFactory),
                                onPressed: () async {
                                  final result = await FilePicker.platform
                                      .pickFiles(type: FileType.image);
                                  if (result == null) return;
                                  // Mendapatkan file yang telah di pick
                                  final PlatformFile file = result.files.first;
                                  // Membuka file terpilih
                                  fileImage.value = File(file.path.toString());
                                },
                                child: const Text('Choose Other images here')),
                          )
                        : const Center(
                            child: Text(
                              'Image format JPEG/JPG/PNG',
                              textAlign: TextAlign.center,
                            ),
                          ),
                  ],
                ),
              ),
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
                padding: EdgeInsets.all(16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Transfer Instructions',
                      style: blackPaymentMedium,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 6.h,
                    ),
                    Container(
                      height: 190.h,
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('1. '),
                              Expanded(
                                child: Text(
                                  'Pembayaran dapat dilakukan melalui Teller bank BRI atau bank lainnya',
                                  maxLines: 2,
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('2. '),
                              Expanded(
                                child: Text(
                                  'Pembayaran dapat dilakukan melalu M-banking/e-money (OVO,DANA dan lainnya)',
                                  maxLines: 2,
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('3. '),
                              Expanded(
                                child: Text(
                                  'Pembayaran dapat di lakukan dengan Transfer ATM, namun pastikan ATM dapat mengeluarkan Struk bukti Transfer',
                                  maxLines: 2,
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('4. '),
                              Expanded(
                                child: Text(
                                  'Pastikan anda mempunya bukti transfer dari transaksi anda, karena akan di butuhkan saat melakukan aktivasi booking.',
                                  maxLines: 3,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
              height: 37.h,
              margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
              child: ButtonComponent(
                  onPress: () async {
                    if (value == null) {
                      showNotification(
                          context, 'Please Insert proof of payment');
                    }
                    try {
                      final result = await data.postProofPayment(
                          data.getUserDetailReservation!.id!,
                          value!,
                          data.getPaymentBankData!.id!);
                      print(result);
                    } catch (e) {
                      e.toString();
                    }

                    fileImage.value = null;
                    Navigator.pop(context);
                  },
                  textButton: 'Done',
                  buttonHeight: 37.h,
                  buttonWidth: double.infinity)),
        ),
      ),
    );
  }
}
