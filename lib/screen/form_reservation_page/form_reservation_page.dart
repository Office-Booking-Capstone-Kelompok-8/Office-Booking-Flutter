import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';
import 'package:provider/provider.dart';

import '../../provider/date_provider.dart';
import '../../utils/constant/app_text_style.dart';
import '../components/button_component.dart';
import '../components/form_component.dart';
import '../components/appbar_component.dart';

class FormReservationPage extends StatefulWidget {
  const FormReservationPage({super.key});

  @override
  State<FormReservationPage> createState() => _FormReservationPageState();
}

class _FormReservationPageState extends State<FormReservationPage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _tenantNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppbarComponent(
          title: 'Reservation Form',
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
            child: Form(
              key: _formkey,
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
                            height: 92.h,
                            width: 83.w,
                            child: Image.network(
                              'https://www.barajacoding.or.id/wp-content/uploads/2022/05/unnamed.jpg',
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
                                  'Jl. Melati no. 75 Kel. yy. Jakarta Barat',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: detailFormGrey,
                                ),
                                Text(
                                  'Price',
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
                  SizedBox(
                    height: 9.h,
                  ),
                  FormComponent(
                    isForm: true,
                    controller: _companyNameController,
                    formHeight: 41.h,
                    formWidth: double.infinity,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    'Tenant name*',
                    style: formTop,
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  FormComponent(
                    isForm: true,
                    controller: _tenantNameController,
                    formHeight: 41.h,
                    formWidth: double.infinity,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    'Phone Number*',
                    style: formTop,
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  FormComponent(
                    isForm: true,
                    controller: _phoneNumberController,
                    formHeight: 41.h,
                    formWidth: double.infinity,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    'Email*',
                    style: formTop,
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  FormComponent(
                    isForm: true,
                    controller: _emailController,
                    formHeight: 41.h,
                    formWidth: double.infinity,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    'Check in',
                    style: formTop,
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  SizedBox(
                    height: 48.h,
                    width: double.infinity,
                    child: Consumer<DateProvider>(
                      builder: (context, date, _) => TextFormField(
                          readOnly: true,
                          // controller: _dateStartController,
                          decoration: InputDecoration(
                            hintText: DateFormat('yyyy/MM/dd')
                                .format(date.getDateStart),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9.r),
                              borderSide: const BorderSide(
                                width: 1,
                                color: AppColors.borderButton,
                              ),
                            ),
                            suffixIcon: IconButton(
                              onPressed: (() async {
                                final selectDate = await showDatePicker(
                                    context: context,
                                    initialDate: date.getDateStart,
                                    firstDate: DateTime.now(),
                                    lastDate:
                                        DateTime(date.getDateStart.year + 5));
                                if (selectDate != null) {
                                  date.setDateStart = selectDate;
                                }
                              }),
                              icon: const Icon(Icons.calendar_today),
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    'Check out',
                    style: formTop,
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  SizedBox(
                    height: 48.h,
                    width: double.infinity,
                    child: Consumer<DateProvider>(
                      builder: (context, date, _) => TextFormField(
                          readOnly: true,
                          // controller: _dateEndController,
                          decoration: InputDecoration(
                            hintText: DateFormat('yyyy/MM/dd')
                                .format(date.getDateEnd),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9.r),
                              borderSide: const BorderSide(
                                width: 1,
                                color: AppColors.borderButton,
                              ),
                            ),
                            suffixIcon: IconButton(
                              onPressed: (() async {
                                final selectDate = await showDatePicker(
                                    context: context,
                                    initialDate: date.getDateEnd,
                                    firstDate: DateTime.now(),
                                    lastDate:
                                        DateTime(date.getDateEnd.year + 5));
                                if (selectDate != null) {
                                  date.setDateEnd = selectDate;
                                  print(date.getDateEnd);
                                }
                              }),
                              icon: const Icon(Icons.calendar_today),
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 65.h,
                  ),
                  Center(
                    child: ButtonComponent(
                        onPress: () {},
                        textButton: 'BOOKING',
                        buttonHeight: 41.h,
                        buttonWidth: double.infinity),
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
