import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/appbar_component.dart';
import '../components/building_grid_component.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarComponent(
        title: 'Building Result',
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 160.w / 220.w,
              mainAxisSpacing: 8.w,
              crossAxisSpacing: 8.w),
          shrinkWrap: true,
          children: const [
            BuildingGridComponent(
              url:
                  'https://unsplash.com/photos/eHD8Y1Znfpk/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MTB8fG9mZmljZSUyMHJvb218ZW58MHx8fHwxNjY5NzE3OTI5&force=true&w=640',
              buildingName: 'Lily Meeting Room over flow test',
              buildingLoc: 'Pancoran, South Jakarta, DKI Jakarta',
              buildingPrice: '10.000.000',
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
