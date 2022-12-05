import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/provider/building_provider.dart';
import 'package:office_booking_app/screen/components/appbar_home.dart';
import 'package:office_booking_app/screen/components/building_grid_component.dart';
import 'package:office_booking_app/screen/components/popular_building_component.dart';
import 'package:office_booking_app/utils/constant/app_text_style.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<BuildingProvider>(context, listen: false)
          .getAllBuilding('', '', '', '');
    });
  }

  @override
  Widget build(BuildContext context) {
    NumberFormat formater = NumberFormat('#,##,000');
    return Scaffold(
      appBar: const AppbarHome(),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 18.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular building by rating',
                    style: detailFormStyle,
                  ),
                  TextButton(onPressed: () {}, child: const Text('View All'))
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                height: 103.h,
                width: 300.w,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) =>
                        const PopularBuildingComponent()),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'All Building in Jakarta',
                style: detailFormStyle,
              ),
              SizedBox(
                height: 16.h,
              ),
              Consumer<BuildingProvider>(
                builder: (context, building, _) => GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 160 / 220,
                      mainAxisSpacing: 8.h,
                      crossAxisSpacing: 8.w),
                  shrinkWrap: true,
                  itemCount: building.getBuilding.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () async {
                      await building.getDetail(building.getBuilding[index].id!);
                      Navigator.pushNamed(
                        context, '/building-detail',
                        // arguments: {
                        //   'id': building.getBuilding[index].id,
                        // }
                      );
                    },
                    child: BuildingGridComponent(
                      url: building.getBuilding[index].pictures!,
                      buildingName: building.getBuilding[index].name!,
                      buildingLoc:
                          '${building.getBuilding[index].location!.district!}, ${building.getBuilding[index].location!.city!}',
                      buildingPrice: formater
                          .format(building.getBuilding[index].price!.monthly!)
                          .toString(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
