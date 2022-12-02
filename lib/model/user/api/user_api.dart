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
}
