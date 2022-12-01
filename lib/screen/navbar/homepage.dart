import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/screen/components/building_grid_component.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';
import 'package:office_booking_app/utils/constant/app_text_style.dart';

import '../components/form_component.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

bool _isSelected = false;

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 18.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Find best office around you',
                style: buildingName,
              ),
              SizedBox(
                height: 16.h,
              ),
              FormComponent(
                isPassword: false,
                isSearch: true,
                formHeight: 41.h,
                formWidth: double.infinity,
                onPress: () {
                  Navigator.pushNamed(context, '/search');
                },
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Office recommendation in Jakarta',
                style: textEmptyReservation,
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                height: 64.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: ChoiceChip(
                        label: SizedBox(
                            height: 40.h,
                            width: 65.w,
                            child: Center(
                                child: Text(
                              'Utara',
                              style: TextStyle(
                                  color: _isSelected
                                      ? AppColors.white
                                      : AppColors.black),
                            ))),
                        selectedColor: AppColors.primary4,
                        selected: _isSelected,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r))),
                        onSelected: (value) {
                          setState(() {
                            _isSelected = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 160 / 220,
                    mainAxisSpacing: 8.h,
                    crossAxisSpacing: 8.w),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/building-detail');
                    },
                    child: BuildingGridComponent(
                      url:
                          'https://unsplash.com/photos/eHD8Y1Znfpk/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MTB8fG9mZmljZSUyMHJvb218ZW58MHx8fHwxNjY5NzE3OTI5&force=true&w=640',
                      buildingName: 'Lily Meeting Room',
                      buildingLoc: 'Pancoran, South Jakarta',
                      buildingPrice: '1.000.000',
                    ),
                  ),
                  BuildingGridComponent(
                    url:
                        'https://unsplash.com/photos/eHD8Y1Znfpk/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MTB8fG9mZmljZSUyMHJvb218ZW58MHx8fHwxNjY5NzE3OTI5&force=true&w=640',
                    buildingName: 'Lily Meeting Room',
                    buildingLoc: 'Pancoran, South Jakarta',
                    buildingPrice: '1.000.000',
                  ),
                  BuildingGridComponent(
                    url:
                        'https://unsplash.com/photos/eHD8Y1Znfpk/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MTB8fG9mZmljZSUyMHJvb218ZW58MHx8fHwxNjY5NzE3OTI5&force=true&w=640',
                    buildingName: 'Lily Meeting Room',
                    buildingLoc: 'Pancoran, South Jakarta',
                    buildingPrice: '1.000.000',
                  ),
                  BuildingGridComponent(
                    url:
                        'https://unsplash.com/photos/eHD8Y1Znfpk/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MTB8fG9mZmljZSUyMHJvb218ZW58MHx8fHwxNjY5NzE3OTI5&force=true&w=640',
                    buildingName: 'Lily Meeting Room',
                    buildingLoc: 'Pancoran, South Jakarta',
                    buildingPrice: '1.000.000',
                  ),
                  BuildingGridComponent(
                    url:
                        'https://unsplash.com/photos/eHD8Y1Znfpk/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MTB8fG9mZmljZSUyMHJvb218ZW58MHx8fHwxNjY5NzE3OTI5&force=true&w=640',
                    buildingName: 'Lily Meeting Room',
                    buildingLoc: 'Pancoran, South Jakarta',
                    buildingPrice: '1.000.000',
                  ),
                  BuildingGridComponent(
                    url:
                        'https://unsplash.com/photos/eHD8Y1Znfpk/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MTB8fG9mZmljZSUyMHJvb218ZW58MHx8fHwxNjY5NzE3OTI5&force=true&w=640',
                    buildingName: 'Lily Meeting Room',
                    buildingLoc: 'Pancoran, South Jakarta',
                    buildingPrice: '1.000.000',
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
