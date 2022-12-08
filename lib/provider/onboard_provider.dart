import 'package:flutter/material.dart';
import 'package:office_booking_app/utils/constant/shared_pref_onboard.dart';
import '../model/onboard/onboard_model.dart';

class OnboardProvider extends ChangeNotifier {
  OnboardProvider() {
    getUserStatus();
  }
  int _pageIndex = 0;
  bool _userOpenApp = false;
  final List<OnboardModel> _onboard = [
    OnboardModel('assets/images/img_onboard1.png', 'SUPERIORITY',
        'Find the convenience of renting an office with a variety of interesting features in it'),
    OnboardModel('assets/images/img_onboard2.png', 'PRICE',
        'Office space that you can rent at the right price with comfortable quality'),
    OnboardModel('assets/images/img_onboard3.png', 'FASCILITY',
        'Complete facilities will make the atmosphere more comfortable and fit for work'),
  ];
  SharedPrefOnboard changeStatus = SharedPrefOnboard();
  List<OnboardModel> get getOnboard => _onboard;
  int get pageIndex => _pageIndex;
  bool get userOpenApp => _userOpenApp;
  set userStatus(bool value) {
    changeStatus.setSkipOnboard(value);
    _userOpenApp = value;
    notifyListeners();
  }

  getUserStatus() async {
    _userOpenApp = await changeStatus.getSkipOnboard();
    notifyListeners();
  }

  set pageIndex(index) {
    _pageIndex = index;
    notifyListeners();
  }
}
