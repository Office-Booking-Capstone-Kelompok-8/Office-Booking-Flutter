import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:office_booking_app/provider/building_provider.dart';
import 'package:office_booking_app/provider/set_state_provider.dart';
import 'package:office_booking_app/screen/components/button_component.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';
import 'package:office_booking_app/utils/constant/app_text_style.dart';
import 'package:office_booking_app/utils/constant/helper.dart';
import 'package:provider/provider.dart';
import '../../screen/components/appbar_component.dart';

class BuildingDetail extends StatefulWidget {
  const BuildingDetail({super.key});

  @override
  State<BuildingDetail> createState() => _BuildingDetailState();
}

class _BuildingDetailState extends State<BuildingDetail> {
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     Map<String, dynamic> argsDetail =
  //         ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
  //     String id = argsDetail['id'];
  //     Provider.of<BuildingProvider>(context, listen: false).getDetail(id);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final detail = Provider.of<BuildingProvider>(context, listen: false);
    NumberFormat formater = NumberFormat('#,##,000');
    return SafeArea(
      child: Scaffold(
        appBar: const AppbarComponent(title: 'Detail Building'),
        body: Container(
          padding: EdgeInsets.fromLTRB(15.w, 0.h, 15.w, 0.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24.h,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: SizedBox(
                    height: 153.h,
                    width: double.infinity,
                    child: PageView.builder(
                        itemBuilder: (context, index) => FittedBox(
                              fit: BoxFit.cover,
                              child: Image.network(detail
                                  .getDetailBuilding.pictures![index].url!),
                            ),
                        itemCount: detail.getDetailBuilding.pictures!.length),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                SizedBox(
                  height: 40.h,
                  child: Text(
                    detail.getDetailBuilding.name!,
                    style: buildingName,
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       children: [
                //         Container(
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(5.r),
                //             color: AppColors.primary3,
                //           ),
                //           height: 22.h,
                //           width: 30.w,
                //           padding: EdgeInsets.symmetric(
                //               vertical: 2.h, horizontal: 3.w),
                //           child: Text(
                //             '4.9',
                //             style: ratingStyle,
                //           ),
                //         ),
                //         SizedBox(
                //           width: 8.w,
                //         ),
                //         Text('(15 Review)'),
                //       ],
                //     ),
                //     TextButton(
                //       onPressed: () {},
                //       child: Text('View All'),
                //       style: TextButton.styleFrom(
                //         splashFactory: NoSplash.splashFactory,
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 16.h,
                ),
                DefaultTabController(
                    length: 2, // length of tabs
                    initialIndex: 0,
                    child: Column(children: <Widget>[
                      TabBar(
                        labelColor: Colors.green,
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(text: 'Tab 1'),
                          Tab(text: 'Tab 2'),
                        ],
                      ),
                      Container(
                          height: 400, //height of TabBarView
                          child: TabBarView(children: <Widget>[
                            Center(
                              child: Text('Display Tab 1',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Center(
                              child: Text('Display Tab 2',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ]))
                    ])),
                Text(
                  'Description',
                  style: detailFormStyle,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  detail.getDetailBuilding.description!,
                  maxLines: 5,
                  style: detailBuilidingStyle,
                ),
                SizedBox(
                  height: 16.h,
                ),
                const Divider(
                  color: AppColors.dividerColor,
                  indent: 1,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'Location',
                  style: detailFormStyle,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  '${detail.getDetailBuilding.location!.address!}, ${detail.getDetailBuilding.location!.district!}, ${detail.getDetailBuilding.location!.city!}',
                  maxLines: 5,
                  style: detailBuilidingStyle,
                ),
                SizedBox(
                  height: 16.h,
                ),
                const Divider(
                  color: AppColors.dividerColor,
                  indent: 1,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'Facility',
                  style: detailFormStyle,
                ),
                SizedBox(
                  height: 8.h,
                ),
                SizedBox(
                  height: Helper.icon.length < 9 ? 107.h : 147.h,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 8.h,
                        crossAxisSpacing: 21.w,
                        childAspectRatio: 1.77),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Icon(
                            Helper.icon[index],
                            size: 20.sm,
                            color: AppColors.primary4,
                          ),
                          Text(Helper.iconName[index]),
                        ],
                      );
                    },
                    itemCount: Helper.icon.length,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                const Divider(
                  color: AppColors.dividerColor,
                  indent: 1,
                ),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
          height: 171.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: detailFormStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Monthly',
                    style: detailBuilidingStyle,
                  ),
                  Row(
                    children: [
                      Text(
                          'IDR ${formater.format(detail.getDetailBuilding.price!.monthly!)}',
                          style: priceBold),
                      const Text(' / month')
                    ],
                  ),
                  Consumer<SetStateProvider>(
                    builder: (context, numChange, _) => Radio(
                      value: 0,
                      groupValue: numChange.number,
                      onChanged: (value) {
                        numChange.number = value;
                      },
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Annual',
                    style: detailBuilidingStyle,
                  ),
                  Row(
                    children: [
                      Text(
                        'IDR ${formater.format(detail.getDetailBuilding.price!.annual!)}',
                        style: priceBold,
                      ),
                      const Text(' / year')
                    ],
                  ),
                  Consumer<SetStateProvider>(
                    builder: (context, numChange, _) => Radio(
                      value: 1,
                      groupValue: numChange.number,
                      onChanged: (value) {
                        numChange.number = value;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  Material(
                      type: MaterialType.transparency,
                      child: Ink(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.primary4, width: 1.w),
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: SizedBox(
                          height: 40.h,
                          width: 40.w,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(1000.0),
                            onTap: () {},
                            child: Icon(
                              Icons.chat,
                              size: 24.sm,
                              color: AppColors.primary4,
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    width: 12.w,
                  ),
                  Consumer<SetStateProvider>(
                    builder: (context, numChange, _) => ButtonComponent(
                        onPress: () {
                          Navigator.pushNamed(context, '/form-page',
                              arguments: {
                                'building-image': detail
                                    .getDetailBuilding.pictures!.first.url!,
                                'building-name': detail.getDetailBuilding.name,
                                'building-address':
                                    '${detail.getDetailBuilding.location!.district!} - ${detail.getDetailBuilding.location!.city!}',
                                'building-price': numChange.number == 0
                                    ? formater.format(
                                        detail.getDetailBuilding.price!.monthly)
                                    : formater.format(
                                        detail.getDetailBuilding.price!.annual)
                              });
                        },
                        textButton: 'Book Now',
                        buttonHeight: 37.h,
                        buttonWidth: 274.w),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
