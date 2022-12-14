import 'package:dio/dio.dart';

import '../../../utils/constant/api_constant.dart';
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
        Api.baseUrl + Api.login,
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
        Api.baseUrl + Api.register,
        data: {
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
        },
      );
      return response.data['message'];
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<String> sendOtp({
    required String email,
  }) async {
    try {
      final response = await _dio.post(
        Api.baseUrl + Api.requestOtp,
        data: {
          'email': email,
        },
      );

      return response.data['message'];
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> verifyOtp({
    required String email,
    required String code,
  }) async {
    try {
      final response = await _dio.post(
        Api.baseUrl + Api.verifyOtp,
        data: {
          'email': email,
          'code': code,
        },
      );
      return response.data;
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<String> resetPassword({
    required String email,
    required String password,
    required String key,
  }) async {
    try {
      final response = await _dio.put(
        Api.baseUrl + Api.resetPassword,
        data: {
          'email': email,
          'password': password,
          'key': key,
        },
      );

      return response.data['message'];
    } on DioError catch (_) {
      rethrow;
    }
  }
}
