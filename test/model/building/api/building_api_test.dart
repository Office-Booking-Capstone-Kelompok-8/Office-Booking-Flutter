import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:office_booking_app/model/building/api/building_api.dart';
import 'package:office_booking_app/model/building/building_model.dart';

import 'building_api_test.mocks.dart';

@GenerateMocks([BuildingApi])
void main() {
  group('test Api Building', () {
    test('test Get Building', () async {
      var modelApi = MockBuildingApi();
      when(modelApi.getAllBuildings()).thenAnswer((_) async => <BuildingModel>[
            BuildingModel(
                id: '',
                location: Location(),
                name: '',
                owner: '',
                pictures: '',
                price: Price(),
                rating: 0,
                reviewCount: 0)
          ]);
      final result = await modelApi.getAllBuildings();
      expect(result.isNotEmpty, true);
    });
  });
}
