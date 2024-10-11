part of 'main_cubit.dart';

class MainState extends Equatable {
  const MainState({
    required this.status,
    this.dataResponse,
    this.exception,
  });

  final AppStateStatus status;
  final CommonDataResponse? dataResponse;
  final MyDioException? exception;

  @override
  List<Object> get props => [status];

  factory MainState.initial() {
    return const MainState(status: AppStateStatus.initial);
  }

  MainState copyWith({
    AppStateStatus? status,
    CommonDataResponse? dataResponse,
    MyDioException? exception,
  }) {
    return MainState(
      status: status ?? this.status,
      dataResponse: dataResponse ?? this.dataResponse,
      exception: exception ?? this.exception,
    );
  }
}
