part of 'register_cubit.dart';

class RegisterState extends Equatable {
  const RegisterState({
    required this.status,
    this.inputPinCode,
    this.errorMessage,
    this.hasMatched,
    this.dataResponse,
    this.exception,
  });

  final AppStateStatus status;
  final String? inputPinCode;
  final String? errorMessage;
  final bool? hasMatched;
  final SignUpDataResponse? dataResponse;
  final MyDioException? exception;

  @override
  List<Object> get props => [status];

  factory RegisterState.initial() {
    return const RegisterState(status: AppStateStatus.initial);
  }

  RegisterState copyWith({
    AppStateStatus? status,
    String? inputPinCode,
    String? errorMessage,
    bool? hasMatched,
    SignUpDataResponse? dataResponse,
    MyDioException? exception,
  }) {
    return RegisterState(
      status: status ?? this.status,
      inputPinCode: inputPinCode ?? this.inputPinCode,
      errorMessage: errorMessage ?? this.errorMessage,
      hasMatched: hasMatched ?? this.hasMatched,
      dataResponse: dataResponse ?? this.dataResponse,
      exception: exception ?? this.exception,
    );
  }
}
