import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/provider/filter_provider.dart';
import 'package:office_booking_app/screen/components/show_state.dart';
import 'package:provider/provider.dart';

import '../../provider/building_provider.dart';
import '../../utils/constant/app_colors.dart';
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
    return Consumer<FilterProvider>(builder: (context, provider, _) {
      final helper = Provider.of<BuildingProvider>(context);
      showState(provider, provider2: helper);
      return Scaffold(
          appBar: const AppbarComponent(
            title: 'Building Result',
            elevation: 0,
          ),
          body: Column(
            children: [
              (provider.showFilterResult.isNotEmpty)
                  ? Container(
                      height: 40.h,
                      margin: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 0),
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: provider.showFilterResult.entries.map((e) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: AppColors.primary4,
                                    alignment: Alignment.center,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.w),
                                    ),
                                    foregroundColor: AppColors.borderButton),
                                onPressed: () async {
                                  await provider.removeFilter(e.key);

                                  if (provider.filterResult.isEmpty) {
                                    await provider.clearState();
                                    if (mounted) {}
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, '/navbar', (route) => false);
                                  }
                                },
                                child: Text(
                                  e.value,
                                  style: const TextStyle(
                                    color: AppColors.white,
                                  ),
                                )),
                          );
                        }).toList(),
                      ),
                    )
                  : Container(),
              (provider.getBuilding.isEmpty)
                  ? const Center(
                      child: Text('Empty Result'),
                    )
                  : Padding(
                      padding: EdgeInsets.all(16.w),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 160.w / 220.w,
                            mainAxisSpacing: 8.w,
                            crossAxisSpacing: 8.w),
                        shrinkWrap: true,
                        itemCount: provider.getBuilding.length,
                        itemBuilder: (context, index) {
                          return BuildingGridComponent(
                            onPress: () async {
                              final result = await provider
                                  .getDetail(provider.getBuilding[index].id!);
                              if (result == "successfull") {
                                if (mounted) {}

                                await helper
                                    .getDetail(provider.getBuilding[index].id!);
                                if (mounted) {}
                                Navigator.pushNamed(
                                  context,
                                  '/building-detail',
                                );
                              }
                            },
                            url: provider.getBuilding[index].pictures!,
                            buildingName: provider.getBuilding[index].name!,
                            buildingLoc:
                                '${provider.getBuilding[index].location!.city!} - ${provider.getBuilding[index].location!.district!}',
                            buildingPrice: provider
                                .getBuilding[index].price!.monthly
                                .toString(),
                          );
                        },
                      ),
                    ),
            ],
          ));
    });
  }
}
