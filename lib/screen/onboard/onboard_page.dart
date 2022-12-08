import 'package:flutter/material.dart';
import 'package:office_booking_app/provider/onboard_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../screen/components/button_component.dart';
import '../../screen/onboard/component/dot_indicator.dart';
import '../../utils/constant/app_text_style.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

PageController _pageController =
    PageController(viewportFraction: 1, keepPage: true);

class _OnboardPageState extends State<OnboardPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<OnboardProvider>(
          builder: (context, value, child) => PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              value.pageIndex = index;
            },
            itemCount: value.getOnboard.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.fromLTRB(20.w, 117.h, 20.w, 23.h),
              child: Stack(
                children: [
                  Column(
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
                          style: onboardSubtitle,
                        ),
                      ),
                      SizedBox(
                        height: value.pageIndex == 2 ? 70.h : 196.h,
                      ),
                      value.pageIndex == 2
                          ? Column(
                              children: [
                                ButtonComponent(
                                    onPress: () {
                                      Navigator.pushNamedAndRemoveUntil(
                                          context, '/login', (route) => false);
                                    },
                                    textButton: 'Join Now',
                                    buttonHeight: 40.h,
                                    buttonWidth: double.infinity),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Consumer<OnboardProvider>(
                                  builder: (context, onboard, child) =>
                                      TextButton(
                                          style: TextButton.styleFrom(
                                            splashFactory:
                                                NoSplash.splashFactory,
                                          ),
                                          onPressed: () async {
                                            onboard.userStatus = true;
                                            Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                '/navbar',
                                                (route) => false);
                                          },
                                          child: Text(
                                            'Skip for now',
                                            style: onboardSkip,
                                          )),
                                )
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                    style: TextButton.styleFrom(
                                      splashFactory: NoSplash.splashFactory,
                                    ),
                                    onPressed: () {
                                      _pageController.jumpToPage(2);
                                    },
                                    child: Text(
                                      'Skip',
                                      style: onboardSkip,
                                    )),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      splashFactory: NoSplash.splashFactory,
                                    ),
                                    onPressed: () {
                                      if (index < 2) {
                                        _pageController.jumpToPage(index + 1);
                                      }
                                    },
                                    child: Text(
                                      'Next',
                                      style: onboardSkip,
                                    )),
                              ],
                            )
                    ],
                  ),
                  Align(
                    alignment: Alignment(0.w, 0.94.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          value.getOnboard.length,
                          (index) => DotIndicator(
                                isActive: index == value.pageIndex,
                              )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
