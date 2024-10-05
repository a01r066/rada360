class SignupDataResponse {
  final bool? success;
  final Map<String, dynamic>? data;
  final String? message;

  const SignupDataResponse({
    this.success,
    this.data,
    this.message,
  });

  @override
  String toString() {
    return 'SignupDataResponse{success: $success, data: $data, message: $message}';
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'data': data,
      'message': message,
    };
  }

  factory SignupDataResponse.fromMap(Map<String, dynamic> map) {
    return SignupDataResponse(
      success: map['success'],
      data: map['data'],
      message: map['message'],
    );
  }
}
