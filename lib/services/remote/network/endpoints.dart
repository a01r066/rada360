class Endpoints {
  Endpoints._();

  static const String baseURL = 'https://dev.rada360.com';
  static const String apiPath = '/api/v1';

  static const int receiveTimeout = 5000;

  static const int connectionTimeout = 3000;

  // Access token
  static const String accessToken = '/api/accessToken';

  // Otp
  static const String otp = '$apiPath/otp';
  static const String createOtp = '$otp/create';
  static const String verifyOtp = '$otp/verify/';

  // Register, login
  static const String user = '$apiPath/user';
  static const String signUp = '$user/signup/';
  static const String signIn = '$user/signin/';
  static const String logout = '$user/logout';
  static const String profile = '$user/profile';

  // Authentication
  static const String forgetPassword = '/api/auth/forget-password';
}
