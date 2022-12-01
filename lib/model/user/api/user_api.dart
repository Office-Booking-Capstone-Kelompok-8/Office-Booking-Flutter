import 'package:dio/dio.dart';
import 'package:office_booking_app/model/user/user_model.dart';
import 'package:office_booking_app/utils/constant/api_constant.dart';

class UserApi {
  final Dio _dio = Dio();

  UserApi() {
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

  Future<UserModel> getUser() async {
    try {
      final response = await _dio.get(Api.baseUrl + Api.userDetail);
      return UserModel.fromJson(response.data['data']);
    } on DioError catch (_) {
      rethrow;
    }
  }
}
