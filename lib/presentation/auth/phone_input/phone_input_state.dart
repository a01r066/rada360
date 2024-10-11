part of 'phone_input_cubit.dart';

class PhoneInputState extends Equatable {
  const PhoneInputState({
    required this.status,
    this.dataResponse,
    this.exception,
  });

  final AppStateStatus status;
  final CommonDataResponse? dataResponse;
  final MyDioException? exception;

  @override
  List<Object> get props => [status];

  factory PhoneInputState.initial() {
    return const PhoneInputState(status: AppStateStatus.initial);
  }

  PhoneInputState copyWith({
    AppStateStatus? status,
    CommonDataResponse? dataResponse,
    MyDioException? exception,
  }) {
    return PhoneInputState(
      status: status ?? this.status,
      dataResponse: dataResponse ?? this.dataResponse,
      exception: exception ?? this.exception,
    );
  }
}
