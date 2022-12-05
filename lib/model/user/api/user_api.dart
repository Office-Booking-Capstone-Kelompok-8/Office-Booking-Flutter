import 'dart:io';

import 'package:dio/dio.dart';
import 'package:office_booking_app/model/user/user_model.dart';
import 'package:office_booking_app/utils/constant/api_constant.dart';

class UserApi {
  final Dio _dio = Dio();
  // String accessToken = '';

  UserApi() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // options.headers['Authorization'] = 'Bearer$accessToken';
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

  Future<UserModel> getUser(String token) async {
    try {
      final response = await _dio.get(Api.baseUrl + Api.userDetail,
          options: Options(headers: {
            "Authorization": "Bearer $token",
          }));
      return UserModel.fromJson(response.data['data']);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<String> changePassword(
      String oldPassword, String newPassword, String token) async {
    try {
      final response = await _dio.put(Api.baseUrl + Api.changePassword,
          data: {
            "oldPassword": oldPassword,
            "newPassword": newPassword,
          },
          options: Options(headers: {
            "Authorization": "Bearer $token",
          }));
      return response.data['message'];
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<String> editProfile(
      String name, String email, String phone, String token) async {
    try {
      final response = await _dio.put(Api.baseUrl + Api.userDetail,
          data: {
            "name": name,
            "email": email,
            "phone": phone,
          },
          options: Options(headers: {
            "Authorization": "Bearer $token",
          }));
      print('yey');
      return response.data['message'];
    } on DioError catch (_) {
      rethrow;
    }
  }

  //belom fix
  Future<String> editPicture(File file, String token) async {
    FormData formData = FormData.fromMap({
      "picture": await MultipartFile.fromFile(
        file.path,
      ),
    });
    try {
      final response = await _dio.put(
        'https://dev.fortyfourvisual.com/v1/users/picture',
        data: formData,
        options: Options(headers: {
          "Authorization": "Bearer $token",
          "content-type": "multipart/form-data",
        }),
      );
      return response.data['message'];
    } on DioError catch (_) {
      rethrow;
    }
  }
}
