import 'package:dio/dio.dart';
import 'package:office_booking_app/model/building/building_detail_model.dart';
import 'package:office_booking_app/model/building/building_model.dart';
import 'package:office_booking_app/utils/constant/api_constant.dart';

class BuildingApi {
  final Dio _dio = Dio();

  Future<List<BuildingModel>> getAllBuildings(String? city, String? district,
      String? dateStart, String? dateEnd) async {
    try {
      final response = await _dio.get(
          '${Api.baseUrl}${Api.building}?city=$city&district=$district&startDate=$dateStart&endDate=$dateEnd');
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
}
