import 'package:flutter/material.dart';
import '../model/onboard/onboard_model.dart';

class OnboardProvider extends ChangeNotifier {
  int _pageIndex = 0;
  final List<OnboardModel> _onboard = [
    OnboardModel('assets/images/img_onboard1.png', 'SUPERIORITY',
        'Find the convenience of renting an office with a variety of interesting features in it'),
    OnboardModel('assets/images/img_onboard2.png', 'PRICE',
        'Office space that you can rent at the right price with comfortable quality'),
    OnboardModel('assets/images/img_onboard3.png', 'FASCILITY',
        'Complete facilities will make the atmosphere more comfortable and fit for work'),
  ];

  List<OnboardModel> get getOnboard => _onboard;
  int get pageIndex => _pageIndex;
  set pageIndex(index) {
    _pageIndex = index;
    notifyListeners();
  }
}
