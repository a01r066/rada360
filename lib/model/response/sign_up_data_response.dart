class SignUpDataResponse {
  final bool? success;
  final UserData? data;
  final String? message;

  const SignUpDataResponse({
    this.success,
    this.data,
    this.message,
  });

  @override
  String toString() {
    return 'SignUpDataResponse{success: $success, data: $data, message: $message}';
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'data': data?.toMap(),
      'message': message,
    };
  }

  factory SignUpDataResponse.fromMap(Map<String, dynamic> map) {
    return SignUpDataResponse(
      success: map['success'],
      data: map['data'] != null ? UserData.fromMap(map['data']) : null,
      message: map['message'],
    );
  }
}

class UserData {
  final String? phoneNumber;
  final String? gender;
  final String? avatar;
  final DateTime? updatedAt; // 2024-10-11T15:53:06.000000Z",
  final DateTime? createdAt; // 2024-10-11T15:53:06.000000Z",
  final int? id;

  const UserData({
    this.phoneNumber,
    this.gender,
    this.avatar,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  @override
  String toString() {
    return 'UserData{phoneNumber: $phoneNumber, gender: $gender, avatar: $avatar, updatedAt: $updatedAt, createdAt: $createdAt, id: $id}';
  }

  Map<String, dynamic> toMap() {
    return {
      'phone_number': phoneNumber,
      'gender': gender,
      'avatar': avatar,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'id': id,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      phoneNumber: map['phone_number'],
      gender: map['gender'],
      avatar: map['avatar'],
      updatedAt: map['updated_at'] as DateTime,
      createdAt: map['created_at'] as DateTime,
      id: map['id'],
    );
  }
}
