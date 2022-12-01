import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/auth/auth_api.dart';
import '../model/signin_model.dart';
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

      users = await service.signIn(
        email: email,
        password: password,
      );
      if (users != null) {
        final helper = await SharedPreferences.getInstance();
        helper.setString('accessToken', users!.accessToken!);
        helper.setString('refreshToken', users!.refreshToken!);
      }
      myState = MyState.loaded;
      notifyListeners();
      return 'Berhasil Login';
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
        /// If want to check status code from service error
        e.response!.statusCode;
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
}
