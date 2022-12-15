import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:office_booking_app/model/building/api/building_api.dart';
import 'package:office_booking_app/model/building/building_detail_model.dart';
import 'package:office_booking_app/model/building/building_model.dart';
import 'package:office_booking_app/utils/state/finite_state.dart';

import '../model/reservation/rating_model.dart';

class BuildingProvider extends ChangeNotifier {
  final BuildingApi service = BuildingApi();
  List<BuildingModel> _buildings = [];
  List<RatingModel> _buildingsRating = [];
  List<BuildingModel> get getBuilding => _buildings;
  List<RatingModel> get buildingsRating => _buildingsRating;
  BuildingDetailModel _detailBuilding = BuildingDetailModel();
  BuildingDetailModel get getDetailBuilding => _detailBuilding;
  MyState myState = MyState.loaded;

  getAllBuilding(String? city, String? district, String? dateStart,
      String? dateEnd) async {
    try {
      myState = MyState.loading;
      final response =
          await service.getAllBuildings(city, district, dateStart, dateEnd);
      _buildings = response;
      myState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        /// If want to check status code from service error
        e.response!.statusCode;
      }

      myState = MyState.failed;
      notifyListeners();
      return null;
    }
  }

  getDetail(String id) async {
    try {
      myState = MyState.loading;
      notifyListeners();
      final response = await service.getBuildingDetail(id);
      _detailBuilding = response;
      myState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        /// If want to check status code from service error
        e.response!.statusCode;
      }

      myState = MyState.failed;
      notifyListeners();
      return null;
    }
  }

  Future<String?> getBuildingRating(String id) async {
    try {
      myState = MyState.loading;
      final response = await service.getRating(id);
      _buildingsRating = response;
      myState = MyState.loaded;
      notifyListeners();
      return 'successfull';
    } catch (e) {
      if (e is DioError) {
        myState = MyState.loaded;
        notifyListeners();
        return '${e.response!.data['message'] ?? 'Error code ${e.response!.statusCode}'}';
      }

      myState = MyState.failed;
      notifyListeners();
      return null;
    }
  }
}
