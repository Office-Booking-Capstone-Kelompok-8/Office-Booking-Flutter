import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:office_booking_app/provider/filter_provider.dart';
import 'package:office_booking_app/screen/components/appbar_component.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';
import 'package:provider/provider.dart';

import '../../provider/set_state_provider.dart';
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
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 16.h, left: 16.w, right: 16.w),
        child: ButtonComponent(
            onPress: () async {
              Navigator.pushNamed(context, '/search-result');
            },
            textButton: 'View Building',
            buttonHeight: 40.h,
            buttonWidth: double.infinity),
      ),
      appBar: const AppbarComponent(
        title: 'Filter By',
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Consumer<FilterProvider>(builder: (context, provider, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExpansionTile(
                title: Text(
                  'Location',
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                // expandedAlignment: Alignment.centerLeft,
                // childrenPadding: EdgeInsets.symmetric(horizontal: 16.w),
                children: [
                  RadioListTile<Districts>(
                    title: const Text('Central Jakarta'),
                    value: Districts.centralJakarta,
                    groupValue: provider.location,
                    onChanged: (value) {
                      provider.changeLocation(value!);
                    },
                  ),
                  RadioListTile<Districts>(
                    title: const Text('east Jakarta'),
                    value: Districts.eastJakarta,
                    groupValue: provider.location,
                    onChanged: (value) {
                      provider.changeLocation(value!);
                    },
                  ),
                  RadioListTile<Districts>(
                    title: const Text('northJakarta'),
                    value: Districts.northJakarta,
                    groupValue: provider.location,
                    onChanged: (value) {
                      provider.changeLocation(value!);
                    },
                  ),
                  RadioListTile<Districts>(
                    title: const Text('southJakarta'),
                    value: Districts.southJakarta,
                    groupValue: provider.location,
                    onChanged: (value) {
                      provider.changeLocation(value!);
                    },
                  ),
                  RadioListTile<Districts>(
                    title: const Text('westJakarta'),
                    value: Districts.westJakarta,
                    groupValue: provider.location,
                    onChanged: (value) {
                      provider.changeLocation(value!);
                    },
                  ),
                  RadioListTile<Districts>(
                    title: const Text('thousandIsland'),
                    value: Districts.thousandIsland,
                    groupValue: provider.location,
                    onChanged: (value) {
                      provider.changeLocation(value!);
                    },
                  ),
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
                            child: Consumer<SetStateProvider>(
                              builder: (context, date, _) => TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(
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
                                            initialDate: date.getDateStart,
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
                          SizedBox(
                            height: 48.h,
                            width: 156.w,
                            child: DropDownTextField(
                              // controller: _dateController,
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
                              enableSearch: true,
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
                                DropDownValueModel(
                                    name: 'name1', value: "value1"),
                                DropDownValueModel(
                                    name: 'name2', value: "value2"),
                                DropDownValueModel(
                                    name: 'name3', value: "value3"),
                                DropDownValueModel(
                                    name: 'name4', value: "value4"),
                                DropDownValueModel(
                                    name: 'name5', value: "value5"),
                                DropDownValueModel(
                                    name: 'name6', value: "value6"),
                                DropDownValueModel(
                                    name: 'name7', value: "value7"),
                                DropDownValueModel(
                                    name: 'name8', value: "value8"),
                              ],
                              dropDownItemCount: 8,
                              onChanged: (val) {
                                // ignore: avoid_print
                                print(val.toString());
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
          );
        }),
      ),
    );
  }
}

class ChildrenTile extends StatelessWidget {
  const ChildrenTile({Key? key, required this.text, this.onTap})
      : super(key: key);
  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        height: 36.h,
        width: double.infinity,
        decoration: const BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(
              width: 0.5,
              color: Color(0xFFDDDDDD),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 14.sp),
        ),
      ),
    );
  }
}
