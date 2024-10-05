import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rada360/model/common/app_state_status.dart';

part 'onboard_state.dart';

class OnboardCubit extends Cubit<OnboardState> {
  OnboardCubit() : super(OnboardState.initial());

  onPageChange(int index) {
    emit(state.copyWith(status: AppStateStatus.loading));
    emit(state.copyWith(status: AppStateStatus.success, currentIndex: index));
  }
}
