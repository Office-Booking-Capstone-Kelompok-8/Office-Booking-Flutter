import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/provider/login_provider.dart';
import 'package:office_booking_app/provider/user_provider.dart';
import 'package:office_booking_app/screen/components/snackbar_component.dart';
import 'package:office_booking_app/screen/login/login_page.dart';
import 'package:provider/provider.dart';

import '../../provider/navbar_provider.dart';
import '../../screen/components/tile_component.dart';
import '../../utils/constant/app_colors.dart';
import '../components/show_state.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) async {
      await Provider.of<UserProvider>(context, listen: false).getUsersDetail();
    });
  }

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<UserProvider>(context, listen: true);
    final data = Provider.of<SignInProvider>(context, listen: true);
    showState(profile, provider2: data);
    return SafeArea(
      child: Scaffold(
        body: profile.getUsers != null
            ? Column(
                children: [
                  Container(
                    height: 60.h,
                    margin: EdgeInsets.all(16.w),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 35.r,
                          backgroundImage:
                              NetworkImage(profile.getUsers!.picture!),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    profile.getUsers!.name!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp),
                                  ),
                                  InkWell(
                                    splashFactory: NoSplash.splashFactory,
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/edit-profile');
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
                                profile.getUsers!.email!,
                                style: TextStyle(
                                    fontSize: 12.sp, color: AppColors.neutral7),
                              ),
                              Text(
                                profile.getUsers!.phone!,
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
                        (profile.getUsers!.verified! == false)
                            ? TileCompnent(
                                text: 'Verify Account',
                                onPress: () async {
                                  showDialogApp(
                                    context: context,
                                    title: 'Send OTP Code',
                                    subtitle:
                                        'Send OTP Code To email ${profile.getUsers!.email!} ?',
                                    buttonTextRight: 'Send',
                                    redLeft: true,
                                    onPressRight: () async {
                                      final result = await profile.sendOtp(
                                          email: profile.getUsers!.email!);
                                      if (result == 'otp sent successfully') {
                                        if (mounted) {}
                                        showNotification(context, result!);
                                        Navigator.pushNamed(
                                            context, '/verify-otp-email',
                                            arguments:
                                                profile.getUsers!.email!);
                                      } else if (result != null) {
                                        if (mounted) {}
                                        showNotification(context, result);
                                      }
                                    },
                                  );
                                },
                              )
                            : Container(),
                        TileCompnent(
                          text: 'Transaction History',
                          onPress: () {
                            Navigator.pushNamed(context, '/order');
                          },
                        ),
                        TileCompnent(
                          text: 'Change Password',
                          onPress: () {
                            Navigator.pushNamed(context, '/change-password');
                          },
                        ),
                        TileCompnent(
                          text: 'Help Center',
                          onPress: () {
                            Navigator.pushNamed(context, '/help-center');
                          },
                        ),
                        TileCompnent(
                          text: 'Logout',
                          textColor: AppColors.error5,
                          onPress: () async {
                            showDialogApp(
                              context: context,
                              title: 'Logout',
                              subtitle:
                                  'Are you sure you want to Logout from the application?',
                              buttonTextLeft: 'Logout',
                              redLeft: true,
                              onPressLeft: () async {
                                final navbar = Provider.of<NavbarProvider>(
                                    context,
                                    listen: false);
                                final result = await data.logOut();
                                if (result != null) {
                                  if (mounted) {}
                                  navbar.currentTab = 0;
                                  showNotification(context, result);
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, '/navbar', (route) => false);
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              )
            : const LoginPage(),
      ),
    );
  }
}
