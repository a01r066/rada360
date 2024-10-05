import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rada360/model/common/app_state_status.dart';
import 'package:rada360/services/local/repositories/pref_repository.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    required this.prefRepository,
  }) : super(SplashState.initial());

  final PrefRepository prefRepository;

  showLoading() {
    emit(state.copyWith(status: AppStateStatus.loading));
    Future.delayed(const Duration(seconds: 3), () {
      final isNeedOnboarding = prefRepository.needOnboarding();
      emit(state.copyWith(
        status: AppStateStatus.success,
        isNeedOnboarding: isNeedOnboarding,
      ));
    });
  }
}
