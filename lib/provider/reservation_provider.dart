import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:office_booking_app/model/reservation/api/reservation_api.dart';
import 'package:office_booking_app/model/reservation/reservation_detail_model.dart';
import 'package:office_booking_app/model/reservation/reservation_model.dart';
import 'package:office_booking_app/utils/state/finite_state.dart';

class ReservationProvider extends ChangeNotifier {
  final ReservationApi service = ReservationApi();
  MyState myState = MyState.loaded;
  List<ReservationModel> _reservation = [];
  List<ReservationModel> get getUserReservation => _reservation;
  ReservationDetailModel? _detailReservation;
  ReservationDetailModel? get getUserDetailReservation => _detailReservation;

  postReservation(String buildingId, String companyName, String startDate,
      int duration) async {
    try {
      myState = MyState.loading;
      final response =
          service.postReservation(buildingId, companyName, startDate, duration);
      myState = MyState.loaded;
      notifyListeners();
      return 'reservation created successfully';
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          myState = MyState.loaded;
          notifyListeners();
          return e.response!.data['message'];
        }
      }

      myState = MyState.failed;
      notifyListeners();
      return null;
    }
  }

  getReservation() async {
    try {
      myState = MyState.loading;
      final response = await service.getReservation();
      _reservation = response;
      myState = MyState.loaded;
      notifyListeners();
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

  getDetailReservation(String id) async {
    try {
      myState = MyState.loading;
      final response = await service.getDetailReservation(id);
      _detailReservation = response;
      myState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          myState = MyState.loaded;
          notifyListeners();
          return e.response!.data['message'];
        }
      }

      myState = MyState.failed;
      notifyListeners();
      return null;
    }
  }
}
