part of 'register_cubit.dart';

class RegisterState extends Equatable {
  const RegisterState({
    required this.status,
    this.inputPinCode,
    this.errorMessage,
    this.hasMatched,
    this.signupDataResponse,
    this.exception,
  });

  final AppStateStatus status;
  final String? inputPinCode;
  final String? errorMessage;
  final bool? hasMatched;
  final SignUpDataResponse? signupDataResponse;
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
    SignUpDataResponse? signupDataResponse,
    MyDioException? exception,
  }) {
    return RegisterState(
      status: status ?? this.status,
      inputPinCode: inputPinCode ?? this.inputPinCode,
      errorMessage: errorMessage ?? this.errorMessage,
      hasMatched: hasMatched ?? this.hasMatched,
      signupDataResponse: signupDataResponse ?? this.signupDataResponse,
      exception: exception ?? this.exception,
    );
  }
}
