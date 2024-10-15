import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rada360/model/common/app_state_status.dart';
import 'package:rada360/model/response/common_data_response.dart';
import 'package:rada360/services/remote/network/dio/my_dio_exception.dart';
import 'package:rada360/services/remote/repositories/api_repositories.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit({
    required this.apiRepositories,
  }) : super(OtpState.initial());

  final ApiRepositories apiRepositories;

  checkIsOtpExpired({required bool isExpired}) {
    emit(state.copyWith(status: AppStateStatus.loading));
    emit(state.copyWith(status: AppStateStatus.success, isExpired: isExpired));
  }

  verifyOtp(
      {required String endpoint, required Map<String, dynamic> data}) async {
    emit(state.copyWith(status: AppStateStatus.loading));
    final response =
        await apiRepositories.verifyOtp(endpoint: endpoint, data: data);
    if (response.isSuccessful() && response.response != null) {
      emit(state.copyWith(
          status: AppStateStatus.done, dataResponse: response.response));
    } else {
      emit(state.copyWith(
          status: AppStateStatus.error,
          exception: response.exception,
          errorMessage: response.exception?.message));
    }
  }

  createOtp(
      {required String endpoint, required Map<String, dynamic> data}) async {
    emit(state.copyWith(status: AppStateStatus.loading));
    final response =
        await apiRepositories.createOtp(endpoint: endpoint, data: data);
    if (response.isSuccessful() && response.response != null) {
      emit(state.copyWith(
        status: AppStateStatus.updated,
        otpDataResponse: response.response,
        isCompleted: null,
        errorMessage: null,
        isExpired: null,
      ));
    } else {
      emit(state.copyWith(
          status: AppStateStatus.error, exception: response.exception));
    }
  }
}
