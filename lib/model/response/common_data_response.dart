class CommonDataResponse {
  final String? message;
  final Map<String, dynamic>? data;

  const CommonDataResponse({
    this.message,
    this.data,
  });

  @override
  String toString() {
    return 'CommonDataResponse{message: $message, data: $data}';
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'data': data,
    };
  }

  factory CommonDataResponse.fromMap(Map<String, dynamic> map) {
    return CommonDataResponse(
      message: map['message'],
      data: map['data'],
    );
  }
}
