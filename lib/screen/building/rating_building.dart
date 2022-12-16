import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:office_booking_app/provider/user_provider.dart';
import 'package:office_booking_app/screen/components/appbar_component.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';
import 'package:provider/provider.dart';

import '../../provider/building_provider.dart';
import '../components/button_component.dart';
import '../components/rating_list_component.dart';

class RatingBuilding extends StatelessWidget {
  const RatingBuilding({super.key});

  @override
  Widget build(BuildContext context) {
    NumberFormat formater = NumberFormat('#,##,000');
    final detail = Provider.of<BuildingProvider>(context, listen: false);
    return Scaffold(
      appBar: const AppbarComponent(title: 'Reviews'),
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
                  final user = context.read<UserProvider>().getUsers;
                  if (user != null) {
                    Navigator.pushNamed(context, '/form-page', arguments: {
                      'building-image':
                          detail.getDetailBuilding.pictures!.first.url!,
                      'building-id': detail.getDetailBuilding.id,
                      'building-name': detail.getDetailBuilding.name,
                      'building-address':
                          '${detail.getDetailBuilding.location!.district!.name!} - ${detail.getDetailBuilding.location!.city!.name!}',
                      'building-price': formater
                          .format(detail.getDetailBuilding.price!.monthly)
                    });
                  } else {
                    Navigator.pushNamed(context, '/login');
                  }
                },
                textButton: 'Book Now',
                buttonHeight: 37.h,
                buttonWidth: 274.w),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'User Review',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.neutral9),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: 'latest',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.neutral9),
                    borderRadius: BorderRadius.circular(6.r),
                    icon: const Icon(
                      Icons.expand_more,
                      color: AppColors.neutral9,
                    ),
                    elevation: 16,
                    items: const [
                      DropdownMenuItem(
                        value: 'latest',
                        child: Text('Latest'),
                      ),
                      DropdownMenuItem(
                        value: 'older',
                        child: Text('Older'),
                      ),
                    ],
                    onChanged: (value) {},
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  const RatingComponent(
                    name: 'Malika Kedelai Hitam',
                    date: '12/12/2022',
                    image:
                        'https://unsplash.com/photos/jzY0KRJopEI/download?ixid=MnwxMjA3fDB8MXxhbGx8fHx8fHx8fHwxNjcxMDg3MjUw&force=true&w=640',
                    comment:
                        'Lorem ipsum dolor sit amet consectetur. Nisi nibh nibh mauris duis enim varius amet. Lobortis auctor libero sit curabitur. Tellus turpis vehicula at semper at non proin volutpat tellus. Dictumst id vitae ipsum eget elit laoreet libero.',
                    rating: 3.9,
                  ),
                  SizedBox(
                    height: 14.w,
                  ),
                  const RatingComponent(
                    name: 'Malika Kedelai Putih',
                    date: '12/12/2022',
                    image:
                        'https://unsplash.com/photos/ViyA5myhBVw/download?ixid=MnwxMjA3fDB8MXxhbGx8fHx8fHx8fHwxNjcxMDkwMzAz&force=true&w=640',
                    comment:
                        'Lorem ipsum dolor sit amet consectetur. Nisi nibh nibh mauris duis enim varius amet. Lobortis auctor libero sit curabitur. Tellus turpis vehicula at semper at non proin volutpat tellus. Dictumst id vitae ipsum eget elit laoreet libero.',
                    rating: 3.9,
                  ),
                  SizedBox(
                    height: 14.w,
                  ),
                  const RatingComponent(
                    name: 'Malika Kedelai Cokelat',
                    date: '12/12/2022',
                    image:
                        'https://unsplash.com/photos/SXWSP9XWGvU/download?ixid=MnwxMjA3fDB8MXxhbGx8fHx8fHx8fHwxNjcxMDkzNTIx&force=true&w=640',
                    comment:
                        'Lorem ipsum dolor sit amet consectetur. Nisi nibh nibh mauris duis enim varius amet. Lobortis auctor libero sit curabitur. Tellus turpis vehicula at semper at non proin volutpat tellus. Dictumst id vitae ipsum eget elit laoreet libero.',
                    rating: 3.9,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
