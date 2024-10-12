import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rada360/common/utils/my_logger.dart';
import 'package:rada360/model/common/app_state_status.dart';
import 'package:rada360/model/response/sign_up_data_response.dart';
import 'package:rada360/services/remote/network/dio/my_dio_exception.dart';
import 'package:rada360/services/remote/repositories/api_repositories.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({
    required this.apiRepositories,
  }) : super(SignInState.initial());

  final ApiRepositories apiRepositories;

  updatePinCode({required String pinCode, required String source}) {
    emit(state.copyWith(status: AppStateStatus.loading));

    if (source == 'input') {
      emit(state.copyWith(
        status: AppStateStatus.success,
        inputPinCode: pinCode,
      ));
    } else {
      final inputPinCode = state.inputPinCode?.toLowerCase();

      final hasMatched = pinCode.toLowerCase() == inputPinCode;
      String errorMessage = "";
      MyLogger.info(
          "inputPinCode: $inputPinCode. confirmPinCode: $pinCode\nhasMatched: $hasMatched");
      if (!hasMatched && inputPinCode?.length == 6 && pinCode.length == 6) {
        errorMessage = "Mật khẩu xác nhận không trùng khớp";
      } else {
        errorMessage = "";
      }

      emit(state.copyWith(
        status: AppStateStatus.success,
        hasMatched: hasMatched,
        errorMessage: errorMessage,
      ));
    }
  }

  signUp({required String endpoint, required FormData formData}) async {
    emit(state.copyWith(status: AppStateStatus.loading));
    final response =
        await apiRepositories.signUp(endpoint: endpoint, formData: formData);
    if (response.isSuccessful() && response.response != null) {
      emit(state.copyWith(
          status: AppStateStatus.success,
          signupDataResponse: response.response));
    } else {
      emit(state.copyWith(
          status: AppStateStatus.error, exception: response.exception));
    }
  }
}
