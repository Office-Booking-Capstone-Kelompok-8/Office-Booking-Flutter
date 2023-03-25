import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/screen/components/show_state.dart';
import 'package:provider/provider.dart';

import '../../provider/building_provider.dart';
import '../../utils/constant/helper.dart';
import '../components/appbar_component.dart';
import '../components/building_grid_component.dart';

class PopularBuildingAll extends StatefulWidget {
  const PopularBuildingAll({super.key});

  @override
  State<PopularBuildingAll> createState() => _PopularBuildingAllState();
}

class _PopularBuildingAllState extends State<PopularBuildingAll> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BuildingProvider>(
      builder: (context, provider, _) {
        showState(provider);
        return Scaffold(
          appBar: const AppbarComponent(
            title: 'Popular Building',
            elevation: 0,
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 160.w / 220.w,
                        mainAxisSpacing: 8.w,
                        crossAxisSpacing: 8.w),
                    shrinkWrap: true,
                    itemCount: provider.getBuildingByRating.length,
                    itemBuilder: (context, index) {
                      return BuildingGridComponent(
                        onPress: () async {
                          final result = await provider.getDetail(
                              provider.getBuildingByRating[index].id!);
                          if (result == "successfull") {
                            if (mounted) {}
                            Navigator.pushNamed(
                              context,
                              '/building-detail',
                            );
                          }
                        },
                        url: provider.getBuildingByRating[index].pictures!,
                        buildingName: provider.getBuildingByRating[index].name!,
                        buildingLoc:
                            '${provider.getBuildingByRating[index].location!.city!} - ${provider.getBuildingByRating[index].location!.district!}',
                        buildingPrice: Helper.convertToIdr(
                            provider.getBuildingByRating[index].price!.monthly!,
                            0,
                            false),
                        rating: provider.getBuildingByRating[index].rating,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
