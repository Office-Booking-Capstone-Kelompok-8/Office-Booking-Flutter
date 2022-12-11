import 'dart:io';

import 'package:dio/dio.dart';
import 'package:office_booking_app/model/auth/signin_model.dart';
import 'package:office_booking_app/model/user/user_model.dart';
import 'package:office_booking_app/utils/constant/api_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserApi {
  final Dio _dio = Dio();
  // String accessToken = '';

  UserApi() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final helper = await SharedPreferences.getInstance();
          final accessToken = helper.getString('accessToken');
          options.headers['Authorization'] = 'Bearer $accessToken';
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (error, handler) async {
          final helper = await SharedPreferences.getInstance();
          if (error.response?.statusCode == 401) {
            final refreshToken = helper.getString('refreshToken');
            if (refreshToken != null) {
              await refreshTokenApi();
              final data = await retry(error.requestOptions);
              return handler.resolve(data);
            }
          }
          return handler.next(error);
        },
      ),
    );
  }

  Future<UserModel> getUser() async {
    try {
      final response = await _dio.get(
        Api.baseUrl + Api.userDetail,
      );
      return UserModel.fromJson(response.data['data']);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<String> changePassword(String oldPassword, String newPassword) async {
    try {
      final response = await _dio.put(
        Api.baseUrl + Api.changePassword,
        data: {
          "oldPassword": oldPassword,
          "newPassword": newPassword,
        },
      );
      return response.data['message'];
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<String> editProfile(String name, String email, String phone) async {
    try {
      final response = await _dio.put(
        Api.baseUrl + Api.userDetail,
        data: {
          "name": name,
          "email": email,
          "phone": phone,
        },
      );
      return response.data['message'];
    } on DioError catch (_) {
      rethrow;
    }
  }

  //belom fix
  Future<String> editPicture(File file) async {
    FormData formData = FormData.fromMap({
      "picture": await MultipartFile.fromFile(
        file.path,
      ),
    });
    try {
      final response = await _dio.put(
        Api.baseUrl + Api.picture,
        data: formData,
      );
      return response.data['message'];
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<void> refreshTokenApi() async {
    final helper = await SharedPreferences.getInstance();

    final refreshToken = helper.getString('refreshToken');
    print(refreshToken);
    if (refreshToken != null) {
      try {
        final response = await _dio.post(
            'https://dev.fortyfourvisual.com/v1/auth/refresh',
            data: {'refreshToken': refreshToken});
        var user = SignInModel.fromJson(response.data['data']);
        // successfully got the new access token
        await helper.setString('accessToken', user.accessToken!);
        await helper.setString('refreshToken', user.refreshToken!);
      } on DioError catch (e) {
        print(e.response!.statusCode);
      }
    }
  }

  Future<Response<dynamic>> retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    return _dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}
