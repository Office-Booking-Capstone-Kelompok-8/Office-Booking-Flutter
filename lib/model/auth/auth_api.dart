import 'package:dio/dio.dart';

import '../signin_model.dart';

class AuthApi {
  final Dio _dio = Dio();

  AuthApi() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );
  }

  Future<SignInModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        'https://dev.fortyfourvisual.com/v1/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      return SignInModel.fromJson(response.data['data']);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<String> signUp({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        'https://dev.fortyfourvisual.com/v1/auth/register',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
        },
      );

      if (response.statusCode == 201) {
        return response.data['message'];
      }
      return 'gagal';
    } on DioError catch (_) {
      rethrow;
    }
  }
}
