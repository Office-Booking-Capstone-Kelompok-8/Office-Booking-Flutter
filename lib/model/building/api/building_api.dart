import 'package:dio/dio.dart';
import 'package:office_booking_app/model/building/building_detail_model.dart';
import 'package:office_booking_app/model/building/building_model.dart';
import 'package:office_booking_app/utils/constant/api_constant.dart';

import '../../reservation/rating_model.dart';

class BuildingApi {
  final Dio _dio = Dio();

  Future<List<BuildingModel>> getAllBuildings() async {
    try {
      final response = await _dio.get(
          '${Api.baseUrl}${Api.building}?limit=10&page=1&city=&district=&startDate=&endDate=');
      List<BuildingModel> building = (response.data['data'] as List)
          .map((e) => BuildingModel.fromJson(e))
          .toList();
      return building;
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<BuildingDetailModel> getBuildingDetail(String id) async {
    try {
      final response = await _dio.get('${Api.baseUrl}${Api.building}/$id');
      return BuildingDetailModel.fromJson(response.data['data']);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<List<RatingModel>> getRating(String id) async {
    try {
      final response =
          await _dio.get('${Api.baseUrl}${Api.reservation}/$id/${Api.review}');
      List<RatingModel> ratingList = (response.data['data'] as List)
          .map((e) => RatingModel.fromJson(e))
          .toList();
      return ratingList;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
