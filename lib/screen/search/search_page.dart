import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/provider/filter_provider.dart';
import 'package:office_booking_app/screen/components/appbar_component.dart';
import 'package:office_booking_app/screen/components/show_state.dart';
import 'package:office_booking_app/screen/components/snackbar_component.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';
import 'package:provider/provider.dart';

import '../../utils/constant/app_text_style.dart';
import '../components/button_component.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProvider>(
      builder: (context, provider, _) {
        showState(provider);
        return Scaffold(
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(bottom: 16.h, left: 16.w, right: 16.w),
            child: ButtonComponent(
              onPress: () async {
                if (provider.filterResult.isNotEmpty) {
                  if (provider.hintDate != null || provider.duration != null) {
                    if (provider.hintDate != null &&
                        provider.duration != null) {
                      final result = await provider.getAllBuilding();
                      if (result == "successfull") {
                        if (mounted) {}
                        Navigator.pushNamed(context, '/search-result');
                      } else if (result != null) {
                        if (mounted) {}
                        showNotification(context, result);
                      }
                    } else {
                      showNotification(context,
                          'start date must be accompanied by a duration, and vice versa.');
                    }
                  } else {
                    final result = await provider.getAllBuilding();
                    if (result == "successfull") {
                      if (mounted) {}
                      Navigator.pushNamed(context, '/search-result');
                    } else if (result != null) {
                      if (mounted) {}
                      showNotification(context, result);
                    }
                  }
                } else {
                  showNotification(context, 'must choose one of the filters');
                }
              },
              textButton: 'View Building',
              buttonHeight: 40.h,
              buttonWidth: double.infinity,
            ),
          ),
          appBar: const AppbarComponent(
            title: 'Filter By',
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExpansionTile(
                  title: Text(
                    'Location',
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    provider.listLocation.length,
                    (index) => RadioListTile<Districts>(
                      title: Text(provider.listLocation[index].text),
                      value: provider.listLocation[index].location,
                      groupValue: provider.location,
                      onChanged: (value) {
                        provider.changeLocation(provider.listLocation[index]);
                      },
                    ),
                  ),
                ),
                ExpansionTile(
                  title: Text('Capacity',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold)),
                  childrenPadding: EdgeInsets.all(16.w),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 48.h,
                          width: 156.w,
                          child: TextField(
                            onTap: () {},
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Minimal',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9.r),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: AppColors.borderButton,
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                if (int.tryParse(value) != null) {
                                  provider.changeMinCapacity(value);
                                } else {
                                  showNotification(context,
                                      'Field Min Capacity can only contain number');
                                }
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 48.h,
                          width: 156.w,
                          child: TextField(
                            onTap: () {},
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Maximal',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9.r),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: AppColors.borderButton,
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                if (int.tryParse(value) != null) {
                                  provider.changeMaxCapacity(value);
                                } else {
                                  showNotification(context,
                                      'Field Max Capacity can only contain number');
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        provider.dataButton.length,
                        (index) => ButtonCapacity(
                            onPress: () {
                              provider.changeMaxCapacityButton(
                                  provider.dataButton[index]);
                            },
                            textButton: provider.dataButton[index],
                            activ: provider.activButton),
                      ),
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text('Date',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold)),
                  childrenPadding: EdgeInsets.all(16.w),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Start Date',
                              style: formTop,
                            ),
                            SizedBox(
                              height: 9.h,
                            ),
                            SizedBox(
                              height: 48.h,
                              width: 156.w,
                              child: TextFormField(
                                onTap: (() async {
                                  final selectDate = await showDatePicker(
                                      context: context,
                                      initialDate: provider.getDateStart,
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(
                                          provider.getDateStart.year + 5));
                                  if (selectDate != null) {
                                    provider.setDateStart = selectDate;
                                    provider.changeDate(selectDate);
                                  }
                                }),
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: provider.hintDate ?? 'Select Date',
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
                                          initialDate: provider.getDateStart,
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(
                                              provider.getDateStart.year + 5));
                                      if (selectDate != null) {
                                        provider.setDateStart = selectDate;
                                        provider.changeDate(selectDate);
                                      }
                                    }),
                                    icon: const Icon(Icons.calendar_today),
                                  ),
                                ),
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
                            SizedBox(
                              height: 48.h,
                              width: 156.w,
                              child: DropDownTextField(
                                textFieldDecoration: InputDecoration(
                                  hintText: 'Select Duration',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(9.r),
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
                                    provider
                                        .changeDuration(val.value.toString());
                                  }
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class ButtonCapacity extends StatelessWidget {
  const ButtonCapacity({
    Key? key,
    required this.onPress,
    required this.textButton,
    required this.activ,
  }) : super(key: key);
  final Function() onPress;
  final String textButton;
  final String? activ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.w,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            alignment: Alignment.center,
            backgroundColor:
                (activ == textButton) ? AppColors.primary4 : AppColors.white,
            minimumSize: Size(60.w, 40.w),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: AppColors.primary4),
              borderRadius: BorderRadius.circular(8.w),
            ),
          ),
          onPressed: onPress,
          child: Text(
            textButton,
            style: TextStyle(
              color: (activ == textButton) ? AppColors.white : AppColors.black,
            ),
          )),
    );
  }
}
