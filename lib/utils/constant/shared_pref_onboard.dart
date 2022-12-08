import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefOnboard {
  static const skipOnboard = 'skip';

  setSkipOnboard(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(skipOnboard, value);
  }

  Future<bool> getSkipOnboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(skipOnboard) ?? false;
  }
}
