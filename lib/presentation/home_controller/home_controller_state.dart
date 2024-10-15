part of 'home_controller_cubit.dart';

class HomeControllerState extends Equatable {
  const HomeControllerState({
    required this.status,
    this.exception,
  });

  final AppStateStatus status;
  final MyDioException? exception;

  @override
  List<Object> get props => [status];

  factory HomeControllerState.initial() {
    return const HomeControllerState(status: AppStateStatus.initial);
  }
}
