import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:office_booking_app/model/auth/api/auth_api.dart';
import 'package:office_booking_app/model/auth/signin_model.dart';

import 'auth_api_test.mocks.dart';

@GenerateMocks([AuthApi])
void main() {
  group('test Api Auth', () {
    test('test Login', () async {
      var modelApi = MockAuthApi();
      when(modelApi.signIn(email: '', password: '')).thenAnswer(
          (_) async => SignInModel(accessToken: '', refreshToken: ''));
      var items = await modelApi.signIn(email: '', password: '');
      expect(items.accessToken != null, true);
    });
  });
}
