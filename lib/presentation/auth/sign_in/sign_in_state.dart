part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  const SignInState({
    required this.status,
    this.authDataResponse,
    this.exception,
  });

  final AppStateStatus status;
  final AuthDataResponse? authDataResponse;
  final MyDioException? exception;

  @override
  List<Object> get props => [status];

  factory SignInState.initial() {
    return const SignInState(status: AppStateStatus.initial);
  }

  SignInState copyWith({
    AppStateStatus? status,
    AuthDataResponse? authDataResponse,
    MyDioException? exception,
  }) {
    return SignInState(
      status: status ?? this.status,
      authDataResponse: authDataResponse ?? this.authDataResponse,
      exception: exception ?? this.exception,
    );
  }
}
