import 'package:flutter/material.dart';

enum Districts {
  none,
  southJakarta,
  northJakarta,
  westJakarta,
  centralJakarta,
  eastJakarta,
  thousandIsland
}

class FilterProvider extends ChangeNotifier {
  Districts _location = Districts.none;
  Districts get location => _location;

  changeLocation(Districts newLocation) {
    _location = newLocation;
    notifyListeners();
  }
}
