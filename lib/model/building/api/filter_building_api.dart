import 'package:dio/dio.dart';
import 'package:office_booking_app/model/building/building_detail_model.dart';
import 'package:office_booking_app/model/building/building_model.dart';
import 'package:office_booking_app/utils/constant/api_constant.dart';

class FilterBuildingApi {
  final Dio _dio = Dio();

  Future<List<BuildingModel>?> getAllBuildings(
      Map<String, dynamic> data) async {
    try {
      final response = await _dio.get(
          '${Api.baseUrl}${Api.building}?limit=10&page=1&city=${(data['location'] != null) ? data['location'].id : ''}${(data['date'] != null) ? '&startDate=${data['date']}' : ''}&duration=${data['duration'] ?? ''}&capacityMin=${data['capacityMin'] ?? ''}&capacityMax=${data['capacityMax'] ?? ''}&order=${data['order'] ?? ''}&sortBy=${data['sortBy'] ?? ''}');
      if (response.data['data'] != null) {
        List<BuildingModel>? building = (response.data['data'] as List)
            .map((e) => BuildingModel.fromJson(e))
            .toList();
        return building;
      } else {
        return null;
      }
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
