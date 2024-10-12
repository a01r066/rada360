class CommonDataResponse {
  final String? message;
  final Map<String, dynamic>? data;
  final dynamic errors;

  const CommonDataResponse({
    this.message,
    this.data,
    required this.errors,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'data': data,
      'errors': errors,
    };
  }

  factory CommonDataResponse.fromMap(Map<String, dynamic> map) {
    return CommonDataResponse(
        message: map['message'], data: map['data'], errors: map['errors']);
  }
}
