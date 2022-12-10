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
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProvider>(
      builder: (context, provider, _) {
        final listSort = provider.listSort;
        showState(provider);
        return Scaffold(
          bottomNavigationBar: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.only(bottom: 16.h, left: 16.w, right: 16.w),
              child: ButtonComponent(
                onPress: () async {
                  _formKey.currentState!.save();
                  if (provider.filterResult.isNotEmpty) {
                    if (provider.hintDate != null ||
                        provider.duration != null) {
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
                      toggleable: true,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 156.w,
                          child: TextFormField(
                            onTap: () {},
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: provider.minCapacity,
                            validator: (value) {
                              if (value != null) {
                                if (value.isEmpty) {
                                  return null;
                                } else if (int.tryParse(value) != null) {
                                  if (int.tryParse(value)! < 0) {
                                    return 'value Capacity must greeter than 0 ';
                                  } else {
                                    return null;
                                  }
                                } else {
                                  return 'value Capacity can only contain number';
                                }
                              } else {
                                return null;
                              }
                            },
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
                            onSaved: (newValue) {
                              if (newValue != null) {
                                if (int.tryParse(newValue) != null ||
                                    newValue.isNotEmpty) {
                                  provider.changeMinCapacity(newValue);
                                } else {
                                  showNotification(context,
                                      'Field Min Capacity can only contain number');
                                }
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          width: 156.w,
                          child: TextFormField(
                            onTap: () {},
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: provider.maxCapacity,
                            validator: (value) {
                              if (value != null) {
                                if (value.isEmpty) {
                                  return null;
                                } else if (int.tryParse(value) != null) {
                                  if (int.tryParse(value)! < 0) {
                                    return 'value Capacity must greeter than 0';
                                  } else {
                                    return null;
                                  }
                                } else {
                                  return 'value Capacity can only contain number';
                                }
                              } else {
                                return null;
                              }
                            },
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
                            onSaved: (newValue) {
                              if (newValue != null) {
                                if (int.tryParse(newValue) != null ||
                                    newValue.isNotEmpty) {
                                  provider.changeMinCapacity(newValue);
                                } else {
                                  showNotification(context,
                                      'Field Min Capacity can only contain number');
                                }
                              }
                            },
                            onChanged: (value) {
                              provider.clearButtonCapacity();
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        provider.dataButton.length,
                        (index) => ButtonCapacity(
                            onPress: () {
                              provider.changeCapacityButton(
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
                                    borderRadius: BorderRadius.circular(8.r),
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
                ),
                ExpansionTile(
                  title: Text(
                    'Sort by',
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    listSort.length,
                    (index) => RadioListTile(
                      title: Text(listSort[index]),
                      value: listSort[index],
                      groupValue: provider.activSort,
                      toggleable: true,
                      onChanged: (value) {
                        provider.changeSort(listSort[index]);
                      },
                    ),
                  ),
                ),
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
      height: 30.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          alignment: Alignment.center,
          backgroundColor:
              (activ == textButton) ? AppColors.primary4 : AppColors.white,
          minimumSize: Size(60.w, 30.w),
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: (activ == textButton) ? 0 : 1,
                color: AppColors.neutral7),
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        onPressed: onPress,
        child: Text(
          textButton,
          style: TextStyle(
            color: (activ == textButton) ? AppColors.white : AppColors.black,
          ),
        ),
      ),
    );
  }
}
