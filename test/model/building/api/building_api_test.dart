import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:office_booking_app/model/building/api/building_api.dart';
import 'package:office_booking_app/model/building/building_detail_model.dart';
// import 'package:office_booking_app/model/building/building_detail_model.dart';
import 'package:office_booking_app/model/building/building_model.dart';
import 'package:office_booking_app/model/reservation/rating_model.dart';

import 'building_api_test.mocks.dart';

@GenerateMocks([BuildingApi])
void main() {
  group('test Api Building', () {
    test('test Get Building', () async {
      var modelApi = MockBuildingApi();
      when(modelApi.getAllBuildings()).thenAnswer((_) async => <BuildingModel>[
            BuildingModel(
                id: '',
                location: null,
                name: '',
                owner: '',
                pictures: '',
                price: null,
                rating: 0,
                reviewCount: 0)
          ]);
      final result = await modelApi.getAllBuildings();
      expect(result.isNotEmpty, true);
    });

    test('test Get Building Detail', () async {
      var modelApi = MockBuildingApi();
      when(modelApi.getBuildingDetail('id'))
          .thenAnswer((_) async => BuildingDetailModel());
      final result = await modelApi.getBuildingDetail('id');
      expect(result.runtimeType == BuildingDetailModel, true);
    });

    test('test Get Review', () async {
      var modelApi = MockBuildingApi();
      when(modelApi.getReview('id'))
          .thenAnswer((_) async => <RatingModel>[RatingModel()]);
      final result = await modelApi.getReview('id');
      expect(result.isNotEmpty, true);
    });
  });
}
