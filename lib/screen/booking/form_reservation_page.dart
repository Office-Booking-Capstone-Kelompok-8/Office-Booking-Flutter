import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:office_booking_app/provider/building_provider.dart';
import 'package:office_booking_app/provider/filter_provider.dart';
import 'package:office_booking_app/provider/reservation_provider.dart';
import 'package:office_booking_app/provider/user_provider.dart';
import 'package:office_booking_app/screen/components/snackbar_component.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';
import 'package:office_booking_app/utils/constant/helper.dart';
import 'package:provider/provider.dart';

import '../../provider/set_state_provider.dart';
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
  late TextEditingController _companyNameController = TextEditingController();
  late TextEditingController _tenantNameController = TextEditingController();
  late TextEditingController _phoneNumberController = TextEditingController();
  late TextEditingController _emailController = TextEditingController();
  @override
  void initState() {
    _companyNameController = TextEditingController();
    _tenantNameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<UserProvider>(context, listen: false);
    _emailController.text = data.getUsers!.email!;
    _phoneNumberController.text = data.getUsers!.phone!;
    Map<String, dynamic> argsForm =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return SafeArea(
      child: Scaffold(
        appBar: const AppbarComponent(
          title: 'Reservation Form',
        ),
        body: SingleChildScrollView(
          child: Padding(
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
                        FittedBox(
                          fit: BoxFit.fill,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: SizedBox(
                              height: 90.h,
                              width: 90.w,
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.network(
                                  argsForm['building-image'],
                                ),
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
                                  argsForm['building-name'],
                                  style: detailFormStyle,
                                ),
                                Text(
                                  argsForm['building-address'],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: detailFormGrey,
                                ),
                                SizedBox(
                                  width: 7.w,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      argsForm['building-price'].toString(),
                                      style: priceBlue,
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
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Company name is required';
                      }
                      return null;
                    },
                    hint: 'Enter your company name',
                    isProfile: true,
                    controller: _companyNameController,
                    formHeight: 41.h,
                    formWidth: double.infinity,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    'Tenant Name',
                    style: formTop,
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  FormComponent(
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tenant name is required';
                      }
                      return null;
                    },
                    hint: 'Enter your name',
                    isProfile: true,
                    controller: _tenantNameController,
                    formHeight: 41.h,
                    formWidth: double.infinity,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    'Phone Number',
                    style: formTop,
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  FormComponent(
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone number is required';
                      }
                      return null;
                    },
                    isProfile: true,
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
                    isProfile: true,
                    isDisable: true,
                    controller: _emailController,
                    formHeight: 41.h,
                    formWidth: double.infinity,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Check in',
                            style: formTop,
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                          SizedBox(
                            height: 41.h,
                            width: 156.w,
                            child: Consumer<SetStateProvider>(
                              builder: (context, date, _) => TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 12.h, left: 16.w),
                                    hintText: DateFormat('dd/MM/yyy')
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
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(
                                                date.getDateStart.year + 5));
                                        if (selectDate != null) {
                                          date.setDateStart = selectDate;
                                        }
                                      }),
                                      icon: const Icon(Icons.calendar_today),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Duration',
                            style: formTop,
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                          Consumer<FilterProvider>(
                            builder: (context, provider, child) => SizedBox(
                              height: 41.h,
                              width: 156.w,
                              child: DropDownTextField(
                                textFieldDecoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(top: 12.h, left: 16.w),
                                  hintText: 'Select Duration',
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
                                dropDownList: const [
                                  DropDownValueModel(name: '1 Month', value: 1),
                                  DropDownValueModel(name: '2 Month', value: 2),
                                  DropDownValueModel(name: '3 Month', value: 3),
                                  DropDownValueModel(name: '4 Month', value: 4),
                                  DropDownValueModel(name: '5 Month', value: 5),
                                  DropDownValueModel(name: '6 Month', value: 6),
                                  DropDownValueModel(name: '7 Month', value: 7),
                                  DropDownValueModel(name: '8 Month', value: 8),
                                  DropDownValueModel(name: '9 Month', value: 9),
                                  DropDownValueModel(
                                      name: '10 Month', value: 10),
                                  DropDownValueModel(
                                      name: '11 Month', value: 11),
                                  DropDownValueModel(
                                      name: '12 Month', value: 12),
                                ],
                                dropDownItemCount: 8,
                                onChanged: (val) {
                                  if (val != null &&
                                      val.runtimeType == DropDownValueModel) {
                                    provider.changeDuration(val.value);
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 65.h,
                  ),
                  Center(
                    child: Consumer4<ReservationProvider, SetStateProvider,
                        FilterProvider, BuildingProvider>(
                      builder: (context, reservation, date, filter, building,
                              _) =>
                          ButtonComponent(
                              onPress: () async {
                                filter.duration != null &&
                                        _formkey.currentState!.validate()
                                    ? showModalBottomSheet(
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20.r),
                                                topRight:
                                                    Radius.circular(20.r))),
                                        builder: (context) => Container(
                                          height: 280.h,
                                          padding: EdgeInsets.all(16.h),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Center(
                                                  child: Text(
                                                'Pricing details',
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              )),
                                              SizedBox(
                                                height: 16.h,
                                              ),
                                              const Divider(),
                                              SizedBox(
                                                height: 16.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Duration',
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${filter.duration} Month',
                                                    style: TextStyle(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 4.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Price/month',
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                    ),
                                                  ),
                                                  Text(
                                                    argsForm['building-price'],
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 16.h,
                                              ),
                                              const Divider(),
                                              SizedBox(
                                                height: 16.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Total payment',
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                    ),
                                                  ),
                                                  Text(
                                                    Helper.convertToIdr(
                                                        (building
                                                                .getDetailBuilding
                                                                .price!
                                                                .monthly! *
                                                            filter.duration!),
                                                        0,
                                                        true),
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.primary4),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 16.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  ButtonComponent(
                                                    onPress: () {
                                                      Navigator.pop(context);
                                                    },
                                                    textButton: 'Cancel',
                                                    buttonHeight: 37.h,
                                                    buttonWidth: 156.w,
                                                    isRed: true,
                                                  ),
                                                  ButtonComponent(
                                                    onPress: () async {
                                                      try {
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                        String finalDate =
                                                            DateFormat(
                                                                    'yyyy-MM-dd')
                                                                .format(date
                                                                    .getDateStart);
                                                        final result =
                                                            await reservation
                                                                .postReservation(
                                                          argsForm[
                                                              'building-id'],
                                                          _companyNameController
                                                              .text,
                                                          finalDate,
                                                          filter.duration!,
                                                        );
                                                        if (mounted) {}
                                                        if (result ==
                                                            'reservation created successfully') {
                                                          showNotification(
                                                              context, result!);
                                                          filter.changeDuration(
                                                              0);
                                                          Navigator
                                                              .pushNamedAndRemoveUntil(
                                                                  context,
                                                                  '/booking-success',
                                                                  (route) =>
                                                                      false);
                                                        } else if (result !=
                                                            null) {
                                                          showNotification(
                                                              context, result);
                                                        }
                                                      } catch (e) {
                                                        showNotification(
                                                            context,
                                                            e.toString());
                                                      }
                                                    },
                                                    textButton: 'Confrirm',
                                                    buttonHeight: 37.h,
                                                    buttonWidth: 156.w,
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : showNotification(context,
                                        'Please fill duration and form ');
                              },
                              textButton: 'BOOKING',
                              buttonHeight: 41.h,
                              buttonWidth: double.infinity),
                    ),
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
