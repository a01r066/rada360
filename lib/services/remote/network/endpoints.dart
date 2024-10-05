class Endpoints {
  Endpoints._();

  static const String baseURL = 'https://dev.rada360.com';
  static const String apiPath = '/api/v1';

  static const int receiveTimeout = 5000;

  static const int connectionTimeout = 3000;

  // Register, login
  static const String user = '/user';
  static const String signUp = '/signup';
  static const String signIn = '/signin';
  static const String logout = '/logout';
  static const String profile = '/profile';

  // Authentication
  static const String forgetPassword = '/api/auth/forget-password';
}
