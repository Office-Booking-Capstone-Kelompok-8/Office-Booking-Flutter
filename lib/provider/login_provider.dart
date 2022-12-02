import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/auth/api/auth_api.dart';
import '../model/auth/signin_model.dart';
import '../utils/state/finite_state.dart';

class SignInProvider extends ChangeNotifier {
  final AuthApi service = AuthApi();

  SignInModel? users;
  SignInModel? get dataUser => users;

  MyState myState = MyState.initial;

  SignInProvider() {
    getPref();
  }
  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      myState = MyState.loading;
      notifyListeners();

      final result = await service.signIn(
        email: email,
        password: password,
      );
      if (result.runtimeType == SignInModel) {
        users = result;
        final helper = await SharedPreferences.getInstance();
        helper.setString('accessToken', result!.accessToken!);
        helper.setString('refreshToken', result!.refreshToken!);
        myState = MyState.loaded;
        notifyListeners();
        return 'Login successful';
      }
      myState = MyState.loaded;
      notifyListeners();
      return result;
    } catch (e) {
      if (e is DioError) {
        /// If want to check status code from service error
        myState = MyState.loaded;
        notifyListeners();
        return e.response!.data['message'];
      }

      myState = MyState.failed;
      notifyListeners();
      return null;
    }
  }

  Future<String?> signUp({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    try {
      myState = MyState.loading;
      notifyListeners();

      final response = await service.signUp(
        name: name,
        phone: phone,
        email: email,
        password: password,
      );

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

  getPref() async {
    final helper = await SharedPreferences.getInstance();
    final accesToken = helper.getString('accesToken');
    final refreshToken = helper.getString('refreshToken');
    if (accesToken != null && refreshToken != null) {
      users = SignInModel(accessToken: accesToken, refreshToken: refreshToken);
      notifyListeners();
    } else {
      users = null;
      notifyListeners();
    }
  }

  Future<String?> sendOtp({
    required String email,
  }) async {
    try {
      myState = MyState.loading;
      notifyListeners();

      final response = await service.sendOtp(email: email);

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

  Future<String?> verfyOtp({
    required String email,
    required String code,
  }) async {
    try {
      myState = MyState.loading;
      notifyListeners();

      final response = await service.verifyOtp(email: email, code: code);

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

  Future<String?> resetPassword({
    required String email,
    required String password,
    required String key,
  }) async {
    try {
      myState = MyState.loading;
      notifyListeners();

      final response = await service.resetPassword(
          email: email, password: password, key: key);

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
}
