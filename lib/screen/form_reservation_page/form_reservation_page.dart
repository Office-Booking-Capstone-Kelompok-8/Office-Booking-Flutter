import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/utils/constant/app_text_style.dart';

import '../components/button_component.dart';
import '..//components/form_component.dart';
import '../components/appbar_component.dart';

class FormReservationPage extends StatefulWidget {
  const FormReservationPage({super.key});

  @override
  State<FormReservationPage> createState() => _FormReservationPageState();
}

class _FormReservationPageState extends State<FormReservationPage> {
  final DateTime _dateStart = DateTime.now();
  final DateTime _dateEnd = DateTime.now();
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _companyName = TextEditingController();
  final TextEditingController _tenantName = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppbarComponent(
          title: 'Form Reservasi',
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(5.w, 0, 16.w, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 92.h,
                          width: 83.w,
                          child: Image.network(
                            'https://www.barajacoding.or.id/wp-content/uploads/2022/05/unnamed.jpg',
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
                                  'Jl. Melati no. 75 Kel. yy. Jakarta Barat',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: detailFormGrey,
                                ),
                                Text(
                                  'Harga',
                                  style: detailFormStyle,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    'Company Name',
                    style: formTop,
                  ),
                  FormComponent(
                    controller: _companyName,
                    formHeight: 40.h,
                    formWidth: 328.w,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Nama Penyewa',
                    style: formTop,
                  ),
                  FormComponent(
                    controller: _tenantName,
                    formHeight: 40.h,
                    formWidth: 328.w,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Tanggal',
                    style: formTop,
                  ),
                  FormComponent(
                    controller: _date,
                    formHeight: 40.h,
                    formWidth: 328.w,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'No.Telepon',
                    style: formTop,
                  ),
                  FormComponent(
                    controller: _phoneNumber,
                    formHeight: 40.h,
                    formWidth: 328.w,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Email',
                    style: formTop,
                  ),
                  FormComponent(
                    controller: _email,
                    formHeight: 40.h,
                    formWidth: 328.w,
                  ),
                  SizedBox(
                    height: 34.h,
                  ),
                  Center(
                    child: ButtonComponent(
                        onPress: () {},
                        textButton: 'BOOKING',
                        buttonHeight: 40.h,
                        buttonWidth: 240.w),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
