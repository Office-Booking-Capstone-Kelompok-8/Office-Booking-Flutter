import 'dart:io';

import 'package:dio/dio.dart';
import 'package:office_booking_app/model/auth/signin_model.dart';
import 'package:office_booking_app/model/reservation/payment_all_bank_model.dart';
import 'package:office_booking_app/model/reservation/payment_bank_model.dart';
import 'package:office_booking_app/model/reservation/payment_building_model.dart';
import 'package:office_booking_app/model/reservation/rating_model.dart';
import 'package:office_booking_app/model/reservation/reservation_detail_model.dart';
import 'package:office_booking_app/model/reservation/reservation_model.dart';
import 'package:office_booking_app/utils/constant/api_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReservationApi {
  final Dio _dio = Dio();
  ReservationApi() {
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
              if (data != null) {
                return handler.resolve(data);
              } else {
                return handler.next(error);
              }
            }
          }
          return handler.next(error);
        },
      ),
    );
  }
  Future<List<ReservationModel>> getReservation() async {
    try {
      final response = await _dio.get(Api.baseUrl + Api.reservation);
      if (response.data['data'] != null) {
        List<ReservationModel> reservationList = (response.data['data'] as List)
            .map((e) => ReservationModel.fromJson(e))
            .toList();
        return reservationList;
      } else {
        return [];
      }
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<ReservationDetailModel> getDetailReservation(String id) async {
    try {
      final response = await _dio.get('${Api.baseUrl}${Api.reservation}/$id');
      return ReservationDetailModel.fromJson(response.data['data']);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<String> postReservation(String buildingId, String companyName,
      String startDate, int duration) async {
    try {
      final response = await _dio.post(Api.baseUrl + Api.reservation, data: {
        "buildingId": buildingId,
        "companyName": companyName,
        "startDate": startDate,
        "duration": duration,
      });

      return response.data['message'];
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<String> cancelReservation(String id) async {
    try {
      final response =
          await _dio.delete('${Api.baseUrl}${Api.reservation}/$id');
      return response.data['message'];
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<String> postReview(String id, int rating, String comment) async {
    try {
      final response = await _dio
          .post('${Api.baseUrl}${Api.reservation}/$id/${Api.review}', data: {
        "rating": rating,
        "comment": comment,
      });
      return response.data['message'];
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<List<RatingModel>> getRating(String id) async {
    try {
      final response =
          await _dio.get('${Api.baseUrl}${Api.reservation}/$id/${Api.review}');
      List<RatingModel> ratingList = (response.data['data'] as List)
          .map((e) => RatingModel.fromJson(e))
          .toList();
      return ratingList;
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<String> deleteRating(String id) async {
    try {
      final response = await _dio
          .delete('${Api.baseUrl}${Api.reservation}/$id/${Api.review}');
      return response.data['message'];
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<List<PaymentAllBankModel>> getPaymentAllBank() async {
    try {
      final response =
          await _dio.get('${Api.baseUrl}${Api.payment}/${Api.method}');
      final listBank = (response.data['data'] as List)
          .map((e) => PaymentAllBankModel.fromJson(e))
          .toList();
      return listBank;
    } catch (_) {
      rethrow;
    }
  }

  Future<PaymentBankModel> getPaymentBank(int bankId) async {
    try {
      final response =
          await _dio.get('${Api.baseUrl}${Api.payment}/${Api.method}/$bankId');
      return PaymentBankModel.fromJson(response.data['data']);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<PaymentBuildingModel> getPaymentBuilding(String reservationId) async {
    try {
      final response =
          await _dio.get('${Api.baseUrl}${Api.payment}/$reservationId');
      return PaymentBuildingModel.fromJson(response.data['data']);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<String> postProofPayment(
      String reservationId, File file, int methodId) async {
    FormData formData = FormData.fromMap({
      "proof": await MultipartFile.fromFile(
        file.path,
      ),
      "methodId": methodId,
    });
    try {
      final response = await _dio
          .post('${Api.baseUrl}${Api.payment}/$reservationId', data: formData);
      return response.data['message'];
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<void> refreshTokenApi() async {
    final helper = await SharedPreferences.getInstance();

    final refreshToken = helper.getString('refreshToken');
    if (refreshToken != null) {
      try {
        final response = await _dio.post(Api.baseUrl + Api.refreshToken,
            data: {'refreshToken': refreshToken});
        var user = SignInModel.fromJson(response.data['data']);
        // successfully got the new access token
        await helper.setString('accessToken', user.accessToken!);
        await helper.setString('refreshToken', user.refreshToken!);
      } on DioError catch (e) {
        await helper.remove('accessToken');
        await helper.remove('refreshToken');
        // ignore: avoid_print
        print(e.response!.statusCode);
      }
    }
  }

  Future<Response<dynamic>?> retry(RequestOptions requestOptions) async {
    final helper = await SharedPreferences.getInstance();
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    try {
      final result = await _dio.request<dynamic>(requestOptions.path,
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters,
          options: options);
      return result;
    } on DioError catch (e) {
      await helper.remove('accessToken');
      await helper.remove('refreshToken');
      // ignore: avoid_print
      print(e.response!.statusCode);
      return null;
    }
  }
}
