part of 'onboard_cubit.dart';

class OnboardState extends Equatable {
  const OnboardState({required this.status, this.currentIndex,});

  final AppStateStatus status;
  final int? currentIndex;

  @override
  List<Object> get props => [status];

  factory OnboardState.initial(){
    return const OnboardState(status: AppStateStatus.initial);
  }

  OnboardState copyWith({
    AppStateStatus? status,
    int? currentIndex,
  }) {
    return OnboardState(
      status: status ?? this.status,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
