import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:office_booking_app/provider/building_provider.dart';
import 'package:office_booking_app/provider/login_provider.dart';
import 'package:office_booking_app/provider/user_provider.dart';
import 'package:office_booking_app/screen/components/button_component.dart';
import 'package:office_booking_app/screen/components/show_state.dart';
import 'package:office_booking_app/screen/components/snackbar_component.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';
import 'package:office_booking_app/utils/constant/app_text_style.dart';
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
    final token = Provider.of<SignInProvider>(context, listen: false);
    final profile = Provider.of<UserProvider>(context, listen: false);
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
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4.r),
                      child: SizedBox(
                        height: 220.h,
                        width: double.infinity,
                        child: PageView.builder(
                            itemBuilder: (context, index) => Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image.network(detail
                                          .getDetailBuilding
                                          .pictures![index]
                                          .url!),
                                    ),
                                    Positioned(
                                      bottom: 8.h,
                                      left: 8.w,
                                      child: Container(
                                        color: const Color(0xFF1F1F1F),
                                        height: 25.h,
                                        width: 43.w,
                                        child: Center(
                                          child: Text(
                                            '${(index + 1).toString()}/${(detail.getDetailBuilding.pictures!.length).toString()}',
                                            style: const TextStyle(
                                                color: AppColors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                            itemCount:
                                detail.getDetailBuilding.pictures!.length),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  detail.getDetailBuilding.name!,
                  style: buildingName,
                ),
                SizedBox(
                  height: 12.h,
                ),
                const Divider(
                  color: AppColors.dividerColor,
                  thickness: 1,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'Start IDR ${formater.format(detail.getDetailBuilding.price!.monthly!)}',
                  style: blueDetailPageLarge,
                ),
                SizedBox(
                  height: 12.h,
                ),
                SizedBox(
                  height: 57.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: 109.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Capacity',
                                style: blueDetailPage,
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.people_alt,
                                    size: 16.sm,
                                    color: AppColors.primary4,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Text(
                                    '${formater.format(detail.getDetailBuilding.capacity).toString()} People',
                                    style: blueDetailPage,
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 109.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Size',
                                style: blueDetailPage,
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.zoom_out_map,
                                    size: 16.sm,
                                    color: AppColors.primary4,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Text(
                                    '${detail.getDetailBuilding.size.toString()} m2',
                                    style: blueDetailPage,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: AppColors.dividerColor,
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: AppColors.primary3,
                          ),
                          height: 22.h,
                          width: 30.w,
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 3.w),
                          child: Text(
                            detail.getDetailBuilding.review!.rating!
                                .toDouble()
                                .toString(),
                            style: ratingStyle,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                            '(${detail.getDetailBuilding.review!.count!.toString()} Review)'),
                      ],
                    ),
                    TextButton(
                      onPressed: () async {
                        // final result = await detail
                        //     .getBuildingRating(detail.getDetailBuilding.id!);
                        // if (result == 'seccessfull') {
                        //   if (mounted) {}
                        //   Navigator.pushNamed(context, '/rating');
                        // } else if (result != null) {
                        //   if (mounted) {}
                        //   showNotification(context, result);
                        // }
                        Navigator.pushNamed(context, '/rating');
                      },
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                      ),
                      child: const Text('View More'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                const Divider(
                  color: AppColors.dividerColor,
                  thickness: 1,
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
                  '${detail.getDetailBuilding.location!.address!}, ${detail.getDetailBuilding.location!.district!.name!}, ${detail.getDetailBuilding.location!.city!.name!}',
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: detailBuilidingStyle,
                ),
                SizedBox(
                  height: 16.h,
                ),
                const Divider(
                  color: AppColors.dividerColor,
                  thickness: 1,
                ),
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
                  detail.getDetailBuilding.description!,
                  maxLines: 5,
                  style: detailBuilidingStyle,
                ),
                SizedBox(
                  height: 16.h,
                ),
                const Divider(
                  color: AppColors.dividerColor,
                  thickness: 1,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'Facility',
                  style: detailFormStyle,
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  height: detail.getDetailBuilding.facilities!.length < 5
                      ? 40.h
                      : detail.getDetailBuilding.facilities!.length < 9
                          ? 80.h
                          : detail.getDetailBuilding.facilities!.length < 13
                              ? 120.h
                              : 160.h,
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
                          SvgPicture.network(
                            detail.getDetailBuilding.facilities![index].icon!,
                            height: 20.h,
                            color: AppColors.primary4,
                          ),
                          Text(detail
                              .getDetailBuilding.facilities![index].name!),
                        ],
                      );
                    },
                    itemCount: detail.getDetailBuilding.facilities!.length,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                const Divider(
                  color: AppColors.dividerColor,
                  thickness: 1,
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
          height: 40.h,
          child: Row(
            children: [
              Material(
                  type: MaterialType.transparency,
                  child: Ink(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primary4, width: 1.w),
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
                    token.dataUser?.accessToken == null
                        ? Navigator.pushNamed(context, '/login')
                        : profile.getUsers?.verified == false
                            ? showDialogApp(
                                context: context,
                                title: 'Send OTP Code',
                                subtitle:
                                    'Account not yet verified, verify now? ',
                                buttonTextRight: 'Verify',
                                redLeft: true,
                                onPressRight: () async {
                                  final result = await profile.sendOtp(
                                      email: profile.getUsers!.email!);
                                  if (result == 'otp sent successfully') {
                                    if (mounted) {}
                                    showNotification(context, result!);
                                    Navigator.pushNamed(
                                        context, '/verify-otp-email',
                                        arguments: profile.getUsers!.email!);
                                  } else if (result != null) {
                                    if (mounted) {}
                                    showNotification(context, result);
                                  }
                                },
                              )
                            : Navigator.pushNamed(context, '/form-page',
                                arguments: {
                                    'building-image': detail
                                        .getDetailBuilding.pictures!.first.url!,
                                    'building-id': detail.getDetailBuilding.id,
                                    'building-name':
                                        detail.getDetailBuilding.name,
                                    'building-address':
                                        '${detail.getDetailBuilding.location!.district!.name!} - ${detail.getDetailBuilding.location!.city!.name!}',
                                    'building-price': formater.format(
                                        detail.getDetailBuilding.price!.monthly)
                                  });
                  },
                  textButton: 'Book Now',
                  buttonHeight: 37.h,
                  buttonWidth: 274.w),
            ],
          ),
        ),
      ),
    );
  }
}
