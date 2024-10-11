class AuthDataResponse {
  final bool? success;
  final Map<String, dynamic>? data;
  final String? token;
  final String? message;

  const AuthDataResponse({
    this.success,
    this.data,
    this.token,
    this.message,
  });

  @override
  String toString() {
    return 'AuthDataResponse{success: $success, data: $data, token: $token, message: $message}';
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'data': data,
      'token': token,
      'message': message,
    };
  }

  factory AuthDataResponse.fromMap(Map<String, dynamic> map) {
    return AuthDataResponse(
      success: map['success'],
      data: map['data'],
      token: map['token'],
      message: map['message'],
    );
  }
}
