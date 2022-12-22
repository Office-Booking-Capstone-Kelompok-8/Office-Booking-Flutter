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

    test('Register', () async {
      var modelApi = MockAuthApi();
      when(modelApi.signUp(
              name: 'name',
              phone: 'phone',
              email: 'email',
              password: 'password'))
          .thenAnswer((_) async => 'user created successfully');
      var result = await modelApi.signUp(
          name: 'name', phone: 'phone', email: 'email', password: 'password');
      expect(result == 'user created successfully', true);
    });

    test('Send Otp', () async {
      var modelApi = MockAuthApi();
      when(modelApi.sendOtp(email: 'email'))
          .thenAnswer((_) async => 'otp sent successfully');
      var result = await modelApi.sendOtp(email: 'email');
      expect(result == 'otp sent successfully', true);
    });

    test('Verif Otp', () async {
      final returnData = {
        "message": "otp verified successfully",
        "data": {"key": "12345adaasdadd6"}
      };
      var modelApi = MockAuthApi();
      when(modelApi.verifyOtp(email: 'email', code: 'code'))
          .thenAnswer((_) async => returnData);
      var result = await modelApi.verifyOtp(email: 'email', code: 'code');
      expect(result == returnData, true);
    });
  });
}
