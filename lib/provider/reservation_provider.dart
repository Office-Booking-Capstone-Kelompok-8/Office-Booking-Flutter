import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:office_booking_app/model/reservation/api/reservation_api.dart';
import 'package:office_booking_app/utils/state/finite_state.dart';

class ReservationProvider extends ChangeNotifier {
  final ReservationApi service = ReservationApi();
  MyState myState = MyState.loaded;

  postReservation(String buildingId, String companyName, String startDate,
      int duration) async {
    try {
      myState = MyState.loading;
      final response =
          service.postReservation(buildingId, companyName, startDate, duration);
      myState = MyState.loaded;
      notifyListeners();
      return response;
    } catch (e) {
      if (e is DioError) {
        myState = MyState.loaded;
        notifyListeners();
        return e.response!.data['message'];
      }

      myState = MyState.failed;
      notifyListeners();
      return null;
    }
  }
}
