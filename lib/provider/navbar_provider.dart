import 'package:flutter/material.dart';
import '../screen/navbar/homepage.dart';
import '../screen/navbar/order_page.dart';
import '../screen/navbar/profile_page.dart';

class NavbarProvider extends ChangeNotifier {
  int _tabIndex = 0;
  final List<Widget> _screens = [
    const Homepage(),
    const OrderPage(),
    const ProfilePage(),
  ];

  set currentTab(int page) {
    _tabIndex = page;
    notifyListeners();
  }

  int get currentTab => _tabIndex;

  get currentScreen => _screens[_tabIndex];
}
