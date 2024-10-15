part of 'otp_cubit.dart';

class OtpState extends Equatable {
  const OtpState({
    required this.status,
    this.dataResponse,
    this.otpDataResponse,
    this.isCompleted,
    this.isExpired,
    this.errorMessage,
    this.exception,
  });

  final AppStateStatus status;
  final CommonDataResponse? dataResponse;
  final CommonDataResponse? otpDataResponse;
  final bool? isCompleted;
  final bool? isExpired;
  final String? errorMessage;
  final MyDioException? exception;

  @override
  List<Object> get props => [status];

  factory OtpState.initial() {
    return const OtpState(status: AppStateStatus.initial);
  }

  OtpState copyWith({
    AppStateStatus? status,
    CommonDataResponse? dataResponse,
    CommonDataResponse? otpDataResponse,
    bool? isCompleted,
    bool? isExpired,
    String? errorMessage,
    MyDioException? exception,
  }) {
    return OtpState(
      status: status ?? this.status,
      dataResponse: dataResponse ?? this.dataResponse,
      otpDataResponse: otpDataResponse ?? this.otpDataResponse,
      isCompleted: isCompleted ?? this.isCompleted,
      isExpired: isExpired ?? this.isExpired,
      errorMessage: errorMessage ?? this.errorMessage,
      exception: exception ?? this.exception,
    );
  }
}
