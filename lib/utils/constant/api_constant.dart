class Api {
  static const String baseUrl = 'https://fahmifadillah.my.id/v1/';
  static const String login = 'auth/login';
  static const String register = 'auth/register';
  static const String logout = 'auth/logout';
  static const String refreshToken = 'auth/refresh';
  static const String requestOtp = 'auth/otp/request/reset-password';
  static const String verifyOtp = 'auth/otp/verify/reset-password';
  static const String resetPassword = 'auth/reset-password';
  static const String userDetail = 'users';
  static const String changePassword = 'users/change-password';
  static const String building = 'buildings';
  static const String buildingFacilities = 'buildings/faclities/category';
  static const String payment = 'payments';
  static const String picture = 'users/picture';
  static const String reservation = 'reservations';
  static const String review = 'reviews';
  static const String requestOtpEmail = 'auth/otp/request/email';
  static const String verifyOtpEmail = 'auth/otp/verify/email';
  static const String method = 'methods';
}
