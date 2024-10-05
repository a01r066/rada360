part of 'splash_cubit.dart';

class SplashState extends Equatable {
  const SplashState({required this.status, this.isNeedOnboarding,});

  final AppStateStatus status;
  final bool? isNeedOnboarding;

  @override
  List<Object> get props => [status];

  factory SplashState.initial(){
    return const SplashState(status: AppStateStatus.initial);
  }

  SplashState copyWith({
    AppStateStatus? status,
    bool? isNeedOnboarding,
  }) {
    return SplashState(
      status: status ?? this.status,
      isNeedOnboarding: isNeedOnboarding ?? this.isNeedOnboarding,
    );
  }
}