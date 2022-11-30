import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/screen/components/button_component.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';
import 'package:office_booking_app/utils/constant/app_text_style.dart';
import 'package:office_booking_app/utils/constant/helper.dart';
import '../../screen/components/appbar_component.dart';

class BuildingDetail extends StatefulWidget {
  const BuildingDetail({super.key});

  @override
  State<BuildingDetail> createState() => _BuildingDetailState();
}

class _BuildingDetailState extends State<BuildingDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppbarComponent(title: 'Detail Building'),
        body: Container(
          padding: EdgeInsets.fromLTRB(15.w, 0.h, 15.w, 0.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: SizedBox(
                    height: 153.h,
                    width: double.infinity,
                    child: PageView.builder(
                        itemBuilder: (context, index) => FittedBox(
                              fit: BoxFit.cover,
                              child: Image.network(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxGBuzZrbeQiISNiDKyJRFu4QKyR54MqssYg&usqp=CAU'),
                            ),
                        itemCount: 3),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                SizedBox(
                    height: 40.h,
                    child: Text(
                      'LILY MEETING ROOM',
                      style: buildingName,
                    )),
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
                Text(
                  'Description',
                  style: detailFormStyle,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Nikmati hunian nyaman dengan letak strategis di Daerah Pancoran. Ukuran ruangan ini sebesar 12mx24m dengan total kapasitas sebanyak 45 orang. ',
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
                  'Pasaraya Blok M Gedung B Lt. 6. Jalan Iskandarsyah II No.7, RW. 2, Melawai, Kebayoran Baru, RT.3/RW.1, Melawai, Kby. Baru',
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
                    physics: NeverScrollableScrollPhysics(),
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
          height: 175.h,
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
                  Text('Monthly'),
                  Text('IDR 350.000/ month'),
                  Radio(
                    value: 'value',
                    groupValue: 'groupValue',
                    onChanged: (value) {},
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Annual'),
                  Text('IDR 11.350.000/ month'),
                  Radio(
                    value: 'value',
                    groupValue: 'groupValue',
                    onChanged: (value) {},
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
                  ButtonComponent(
                      onPress: () {
                        Navigator.pushNamed(context, '/form-page');
                      },
                      textButton: 'Book Now',
                      buttonHeight: 37.h,
                      buttonWidth: 274.w),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
