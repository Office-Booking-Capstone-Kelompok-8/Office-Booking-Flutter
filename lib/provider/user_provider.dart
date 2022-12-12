import 'dart:io';

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

  getUsersDetail() async {
    try {
      myState = MyState.loading;
      final response = await service.getUser();
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

  changePassword(String oldPassword, String newPassword) async {
    try {
      myState = MyState.loading;
      final response = await service.changePassword(oldPassword, newPassword);
      myState = MyState.loaded;
      notifyListeners();
      return response;
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          myState = MyState.loaded;
          notifyListeners();
          return e.response!.data['message'];
        }
      }

      myState = MyState.failed;
      notifyListeners();
      return null;
    }
  }

  editProfile(String name, String email, String phone) async {
    try {
      myState = MyState.loading;
      final response = await service.editProfile(name, email, phone);
      myState = MyState.loaded;
      notifyListeners();
      return response;
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          myState = MyState.loaded;
          notifyListeners();
          return e.response!.data['message'];
        }
      }

      myState = MyState.failed;
      notifyListeners();
      return null;
    }
  }

  Future<String?> editPicture({
    required File file,
  }) async {
    try {
      myState = MyState.loading;
      notifyListeners();

      final response = await service.editPicture(file);

      myState = MyState.loaded;
      notifyListeners();
      return response;
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          myState = MyState.loaded;
          notifyListeners();
          return e.response!.statusCode.toString();
        }
      }

      myState = MyState.failed;
      notifyListeners();
      return null;
    }
  }
}
