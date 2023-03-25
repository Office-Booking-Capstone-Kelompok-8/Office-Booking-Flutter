// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/provider/building_provider.dart';
import 'package:office_booking_app/screen/components/appbar_home.dart';
import 'package:office_booking_app/screen/components/building_grid_component.dart';
import 'package:office_booking_app/screen/components/popular_building_component.dart';
import 'package:office_booking_app/utils/constant/app_text_style.dart';
import 'package:office_booking_app/utils/constant/helper.dart';
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
      Provider.of<BuildingProvider>(context, listen: false).getAllBuilding();
      Provider.of<BuildingProvider>(context, listen: false)
          .getAllBuildingRating();
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/allrating');
                      },
                      child: const Text('View All'))
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Consumer<BuildingProvider>(
                builder: (context, bRating, _) => SizedBox(
                  height: 103.h,
                  width: 300.w,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: bRating.getBuildingByRating.length > 3
                          ? 3
                          : bRating.getBuildingByRating.length,
                      itemBuilder: (context, index) => InkWell(
                            splashFactory: NoSplash.splashFactory,
                            onTap: () async {
                              await bRating
                                  .getDetail(bRating.getBuilding[index].id!);

                              Navigator.pushNamed(
                                context,
                                '/building-detail',
                              );
                            },
                            child: PopularBuildingComponent(
                              buildingName:
                                  bRating.getBuildingByRating[index].name!,
                              city: bRating
                                  .getBuildingByRating[index].location!.city!,
                              imgUrl:
                                  bRating.getBuildingByRating[index].pictures!,
                              buildingPrice: Helper.convertToIdr(
                                  bRating.getBuildingByRating[index].price!
                                      .monthly!,
                                  0,
                                  false),
                            ),
                          )),
                ),
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
                      childAspectRatio: 160.w / 220.w,
                      mainAxisSpacing: 8.w,
                      crossAxisSpacing: 8.w),
                  shrinkWrap: true,
                  itemCount: building.getBuilding.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () async {
                      await building.getDetail(building.getBuilding[index].id!);

                      Navigator.pushNamed(
                        context,
                        '/building-detail',
                      );
                    },
                    child: BuildingGridComponent(
                      url: building.getBuilding[index].pictures!,
                      buildingName: building.getBuilding[index].name!,
                      buildingLoc:
                          '${building.getBuilding[index].location!.district!}, ${building.getBuilding[index].location!.city!}',
                      buildingPrice: Helper.convertToIdr(
                          building.getBuilding[index].price!.monthly!,
                          0,
                          false),
                      rating: building.getBuilding[index].rating,
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
