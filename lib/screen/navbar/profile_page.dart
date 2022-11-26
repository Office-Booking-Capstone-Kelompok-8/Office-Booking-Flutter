import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../screen/components/tile_component.dart';
import '../../utils/constant/app_colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 60.h,
              margin: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 35.r,
                    backgroundColor: AppColors.bg1,
                    foregroundColor: Colors.black,
                    child: Icon(
                      Icons.person_rounded,
                      size: 59.sm,
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sabrina Maharani',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14.sp),
                            ),
                            InkWell(
                              splashFactory: NoSplash.splashFactory,
                              onTap: () {
                                Navigator.pushNamed(context, '/edit-profile');
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10.w),
                                child: Icon(
                                  Icons.edit,
                                  size: 16.w,
                                ),
                              ),
                            )
                          ],
                        ),
                        Text(
                          'sabrina07@upi.edu',
                          style: TextStyle(
                              fontSize: 12.sp, color: AppColors.neutral7),
                        ),
                        Text(
                          '+6282110766872',
                          style: TextStyle(
                              fontSize: 12.sp, color: AppColors.neutral7),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: EdgeInsets.all(8.h),
              child: Column(
                children: [
                  TileCompnent(
                    text: 'Transaction History',
                    onPress: () {
                      Navigator.pushNamed(context, '/order');
                    },
                  ),
                  TileCompnent(text: 'Change Password'),
                  TileCompnent(text: 'Help Center'),
                  TileCompnent(
                    text: 'Logout',
                    textColor: AppColors.error5,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
