import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constant/app_colors.dart';
import '../components/building_grid_component.dart';
import '../components/form_component.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 80.h,
        titleSpacing: 0,
        title: Container(
          margin: EdgeInsets.only(right: 16.w),
          child: FormComponent(
            controller: _searchController,
            isSearch: true,
            isAuth: true,
            formHeight: 50.h,
            formWidth: double.infinity,
            hint: 'Search Buildings',
            prefixIcon: Icons.search,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 160 / 180),
          shrinkWrap: true,
          children: const [
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
            BuildingGridComponent(
              url:
                  'https://unsplash.com/photos/eHD8Y1Znfpk/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MTB8fG9mZmljZSUyMHJvb218ZW58MHx8fHwxNjY5NzE3OTI5&force=true&w=640',
              buildingName: 'Lily Meeting Room',
              buildingLoc: 'Pancoran, South Jakarta',
              buildingPrice: '1.000.000',
            ),
          ],
        ),
      ),
    );
  }
}
