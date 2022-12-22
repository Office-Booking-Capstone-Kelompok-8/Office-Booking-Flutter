import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:office_booking_app/model/reservation/api/reservation_api.dart';
import 'package:office_booking_app/model/reservation/payment_all_bank_model.dart';
import 'package:office_booking_app/model/reservation/payment_bank_model.dart';
import 'package:office_booking_app/model/reservation/payment_building_model.dart';
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
  PaymentBankModel? _paymentBankData;
  PaymentBankModel? get getPaymentBankData => _paymentBankData;
  PaymentBuildingModel? _paymentBuildingData;
  PaymentBuildingModel? get getPaymentBuildingData => _paymentBuildingData;
  List<PaymentAllBankModel> _allBank = [];
  List<PaymentAllBankModel> get getAllBank => _allBank;

  Future<String?> postReservation(String buildingId, String companyName,
      String startDate, int duration) async {
    try {
      myState = MyState.loading;
      notifyListeners();
      final response = await service.postReservation(
          buildingId, companyName, startDate, duration);
      myState = MyState.loaded;
      notifyListeners();
      return response;
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          myState = MyState.loaded;
          notifyListeners();
          return 'Error ${e.response!.data['message'] ?? e.response!.statusCode!}';
        }
      } else {
        myState = MyState.failed;
        notifyListeners();
        return null;
      }
    }
    return null;
  }

  getReservation() async {
    try {
      myState = MyState.loading;
      notifyListeners();
      final response = await service.getReservation();
      response.sort(
        (a, b) => b.createdAt!.compareTo(a.createdAt!),
      );
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
      notifyListeners();
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

  cancelReservation(String id) async {
    try {
      myState = MyState.loading;
      notifyListeners();
      final response = await service.cancelReservation(id);
      myState = MyState.loaded;
      notifyListeners();
      return response;
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          return e.response!.data['message'];
        }
        myState = MyState.failed;
        notifyListeners();
        return null;
      }
    }
  }

  getPaymentAllBank() async {
    try {
      myState = MyState.loading;
      notifyListeners();
      final response = await service.getPaymentAllBank();
      _allBank = response;
      myState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          return e.response!.data['message'];
        }
      }
      myState = MyState.failed;
      notifyListeners();
      return null;
    }
  }

  getPaymentBank(int bankId) async {
    try {
      myState = MyState.loading;
      notifyListeners();
      final response = await service.getPaymentBank(bankId);
      _paymentBankData = response;
      myState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          return e.response!.data['message'];
        }
      }
      myState = MyState.failed;
      notifyListeners();
      return null;
    }
  }

  getPaymentBuilding(String reservationId) async {
    try {
      myState = MyState.loading;
      notifyListeners();
      final response = await service.getPaymentBuilding(reservationId);
      _paymentBuildingData = response;
      myState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          return e.response!.data['message'];
        }
      }
      myState = MyState.failed;
      notifyListeners();
      return null;
    }
  }

  postProofPayment(String reservationId, File file, int methodId) async {
    try {
      myState = MyState.loading;
      notifyListeners();
      final response =
          await service.postProofPayment(reservationId, file, methodId);
      myState = MyState.loaded;
      notifyListeners();
      return response;
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          return e.response!.data['message'];
        }
      }
      myState = MyState.failed;
      notifyListeners();
      return null;
    }
  }
}
