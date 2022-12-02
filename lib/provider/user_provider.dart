import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:office_booking_app/model/user/api/user_api.dart';
import 'package:office_booking_app/model/user/user_model.dart';
import 'package:office_booking_app/utils/state/finite_state.dart';

class UserProvider extends ChangeNotifier {
  final UserApi service = UserApi();
  UserModel _users = UserModel();
  UserModel get getUsers => _users;
  MyState myState = MyState.loaded;
  getUsersDetail(String token) async {
    try {
      myState = MyState.loading;
      final response = await service.getUser(token);
      _users = response;
      myState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        /// If want to check status code from service error
        e.response!.statusCode;
      }

      myState = MyState.failed;
      notifyListeners();
      return null;
    }
  }
}
