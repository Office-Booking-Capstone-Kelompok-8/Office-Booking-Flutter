import 'package:flutter/cupertino.dart';
import 'package:office_booking_app/model/onboard/onboard_model.dart';

class OnboardProvider extends ChangeNotifier {
  int _pageIndex = 0;
  final List<OnboardModel> _onboard = [
    OnboardModel('assets/images/img_onboard1.png', 'KEUNGGULAN',
        'Temukan Kemudahan dalam menyewa kantor dengan berbagai fitur menarik didalamnya'),
    OnboardModel('assets/images/img_onboard2.png', 'HARGA',
        'Tempat Office yang bisa Anda sewa dengan harga pas dengan kualitas yang nyaman'),
    OnboardModel('assets/images/img_onboard3.png', 'FASILITAS',
        'Fasilitas yang lengkap akan membuat suasana menjadi lebih nyaman dan pas untuk bekerja'),
  ];

  List<OnboardModel> get getOnboard => _onboard;
  int get pageIndex => _pageIndex;
  set pageIndex(index) {
    _pageIndex = index;
    notifyListeners();
  }
}
