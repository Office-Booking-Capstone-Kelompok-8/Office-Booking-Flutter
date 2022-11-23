import 'package:flutter/material.dart';
import 'package:office_booking_app/provider/onboard_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/screen/components/button_component.dart';
import 'package:office_booking_app/utils/constant/app_text_style.dart';
import 'package:provider/provider.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<OnboardProvider>(
          builder: (context, value, child) => PageView.builder(
            onPageChanged: (index) {
              value.pageIndex = index;
            },
            itemCount: value.getOnboard.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.fromLTRB(20.w, 117.h, 20.w, 23.h),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 122.r,
                    child: Image.asset(value.getOnboard[index].imgAsset),
                  ),
                  SizedBox(
                    height: 62.h,
                  ),
                  Text(
                    value.getOnboard[index].title,
                    style: onboardTitle,
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                  SizedBox(
                    height: 63.h,
                    width: 238.w,
                    child: Text(
                      value.getOnboard[index].subTitle,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: buttonStyle,
                    ),
                  ),
                  SizedBox(
                    height: value.pageIndex == 2 ? 70.h : 196.h,
                  ),
                  value.pageIndex == 2
                      ? Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ButtonComponent(
                                    onPress: () {
                                      Navigator.pushNamedAndRemoveUntil(context,
                                          '/register', (route) => false);
                                    },
                                    textButton: 'Daftar',
                                    buttonHeight: 40.h,
                                    buttonWidth: 108.w),
                                ButtonComponent(
                                    onPress: () {
                                      Navigator.pushNamedAndRemoveUntil(
                                          context, '/login', (route) => false);
                                    },
                                    textButton: 'Masuk',
                                    buttonHeight: 40.h,
                                    buttonWidth: 108.w),
                              ],
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, '/navbar', (route) => false);
                                },
                                child: Text(
                                  'Lewati untuk saat ini',
                                  style: onboardSkip,
                                ))
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  index < 2 ? index += 1 : index += 0;
                                  print(index);
                                },
                                child: Text(
                                  'Lewati',
                                  style: onboardSkip,
                                )),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Lanjut',
                                  style: onboardSkip,
                                )),
                          ],
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
