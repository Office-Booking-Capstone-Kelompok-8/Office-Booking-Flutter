import 'package:flutter/material.dart';
import 'package:office_booking_app/provider/navbar_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';
import 'package:provider/provider.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
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
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.article),
                label: 'Pesanan',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.mail),
                label: 'Inbox',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            backgroundColor: AppColors.buttonColor,
            currentIndex: value.currentTab,
            // ganti ini belom fix
            unselectedItemColor: AppColors.black,
            iconSize: 24.w,
            // ini juga
            selectedItemColor: AppColors.white,
            onTap: (index) {
              value.currentTab = index;
            },
          ),
        ),
      ),
    ));
  }
}
