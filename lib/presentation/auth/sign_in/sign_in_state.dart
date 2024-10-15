part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  const SignInState({
    required this.status,
    this.inputPinCode,
    this.errorMessage,
    this.hasMatched,
    this.signInDataResponse,
    this.otpDataResponse,
    this.counter,
    this.exception,
  });

  final AppStateStatus status;
  final String? inputPinCode;
  final String? errorMessage;
  final bool? hasMatched;
  final CommonDataResponse? signInDataResponse;
  final CommonDataResponse? otpDataResponse;
  final int? counter;
  final MyDioException? exception;

  @override
  List<Object> get props => [status];

  factory SignInState.initial() {
    return const SignInState(status: AppStateStatus.initial);
  }

  SignInState copyWith({
    AppStateStatus? status,
    String? inputPinCode,
    String? errorMessage,
    bool? hasMatched,
    CommonDataResponse? signInDataResponse,
    CommonDataResponse? otpDataResponse,
    int? counter,
    MyDioException? exception,
  }) {
    return SignInState(
      status: status ?? this.status,
      inputPinCode: inputPinCode ?? this.inputPinCode,
      errorMessage: errorMessage ?? this.errorMessage,
      hasMatched: hasMatched ?? this.hasMatched,
      signInDataResponse: signInDataResponse ?? this.signInDataResponse,
      otpDataResponse: otpDataResponse ?? this.otpDataResponse,
      counter: counter ?? this.counter,
      exception: exception ?? this.exception,
    );
  }
}
