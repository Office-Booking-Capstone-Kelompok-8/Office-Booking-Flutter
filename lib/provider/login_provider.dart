import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/auth/api/auth_api.dart';
import '../model/auth/signin_model.dart';
import '../utils/state/finite_state.dart';

class SignInProvider extends ChangeNotifier {
  final AuthApi _service = AuthApi();

  SignInModel? _users;
  SignInModel? get dataUser => _users;

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

      final result = await _service.signIn(
        email: email,
        password: password,
      );
      _users = result;
      final helper = await SharedPreferences.getInstance();
      await helper.setString('accessToken', result.accessToken!);
      await helper.setString('refreshToken', result.refreshToken!);
      myState = MyState.loaded;
      notifyListeners();
      return 'Login successful';
    } catch (e) {
      if (e is DioError) {
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

      final response = await _service.signUp(
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

  Future<void> getPref() async {
    try {
      final helper = await SharedPreferences.getInstance();
      final accesToken = helper.getString('accessToken');
      final refreshToken = helper.getString('refreshToken');
      _users = SignInModel(accessToken: accesToken, refreshToken: refreshToken);
      notifyListeners();
    } catch (_) {}
  }

  Future<String?> logOut() async {
    try {
      final helper = await SharedPreferences.getInstance();
      await helper.remove('accessToken');
      await helper.remove('refreshToken');
      _users = null;
      notifyListeners();
      return 'Logout successful';
    } catch (e) {
      return null;
    }
  }

  Future<String?> sendOtp({
    required String email,
  }) async {
    try {
      myState = MyState.loading;
      notifyListeners();

      final response = await _service.sendOtp(email: email);

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

  Future<Map<String, dynamic>?> verfyOtp({
    required String email,
    required String code,
  }) async {
    try {
      myState = MyState.loading;
      notifyListeners();

      final response = await _service.verifyOtp(email: email, code: code);

      myState = MyState.loaded;
      notifyListeners();
      return response;
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          myState = MyState.loaded;
          notifyListeners();
          return {'message': e.response!.data['message']};
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

      final response = await _service.resetPassword(
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
