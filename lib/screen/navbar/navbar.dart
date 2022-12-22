import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/provider/reservation_provider.dart';
import 'package:office_booking_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

import '../../provider/navbar_provider.dart';
import '../../utils/constant/app_colors.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) async {
      await Provider.of<UserProvider>(context, listen: false).getUsersDetail();
    });
    Future.delayed(Duration.zero).then((value) async {
      await Provider.of<ReservationProvider>(context, listen: false)
          .getReservation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Consumer<NavbarProvider>(
      builder: (context, value, child) => Scaffold(
        body: value.currentScreen,
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20))),
          height: 60.h,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.article_outlined),
                label: 'Booking',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined),
                label: 'Profile',
              ),
            ],
            backgroundColor: AppColors.white,
            currentIndex: value.currentTab,
            iconSize: 24.sm,
            selectedItemColor: AppColors.primary4,
            onTap: (index) async {
              if (index == 1 || index == 2) {
                final data = Provider.of<UserProvider>(context, listen: false);
                if (data.getUsers == null) {
                  if (mounted) {}
                  Navigator.pushNamed(context, '/login');
                } else {
                  value.currentTab = index;
                }
              } else {
                value.currentTab = index;
              }
            },
          ),
        ),
      ),
    ));
  }
}
