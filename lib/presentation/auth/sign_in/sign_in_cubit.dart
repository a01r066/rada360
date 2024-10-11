import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rada360/common/utils/my_logger.dart';
import 'package:rada360/model/common/app_state_status.dart';
import 'package:rada360/model/response/auth_data_response.dart';
import 'package:rada360/services/remote/network/dio/my_dio_exception.dart';
import 'package:rada360/services/remote/repositories/api_repositories.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({
    required this.apiRepositories,
  }) : super(SignInState.initial());

  final ApiRepositories apiRepositories;

  createOtp(
      {required String endpoint, required Map<String, dynamic> data}) async {
    emit(state.copyWith(status: AppStateStatus.loading));
    final response =
        await apiRepositories.createOtp(endpoint: endpoint, data: data);
    if (response.isSuccessful() && response.response != null) {
      MyLogger.info("createOtp response: ${response.response.toString()}");
      emit(state.copyWith(status: AppStateStatus.success));
    } else {
      emit(state.copyWith(
          status: AppStateStatus.error, exception: response.exception));
    }
  }

  signIn({required String endpoint, required Map<String, dynamic> data}) async {
    emit(state.copyWith(status: AppStateStatus.loading));
    final response =
        await apiRepositories.signIn(endpoint: endpoint, data: data);
    if (response.isSuccessful() && response.response != null) {
      emit(state.copyWith(
          status: AppStateStatus.success, authDataResponse: response.response));
    } else {
      emit(state.copyWith(
          status: AppStateStatus.error, exception: response.exception));
    }
  }
}
