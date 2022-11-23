import 'package:flutter/cupertino.dart';
import 'package:office_booking_app/screen/navbar/homepage.dart';
import 'package:office_booking_app/screen/navbar/inbox_page.dart';
import 'package:office_booking_app/screen/navbar/order_page.dart';
import 'package:office_booking_app/screen/navbar/profile_page.dart';

class NavbarProvider extends ChangeNotifier {
  int _tabIndex = 0;
  final List<Widget> _screens = [
    const Homepage(),
    const OrderPage(),
    const InboxPage(),
    const ProfilePage(),
  ];

  set currentTab(int page) {
    _tabIndex = page;
    notifyListeners();
  }

  int get currentTab => _tabIndex;

  get currentScreen => _screens[_tabIndex];
}
