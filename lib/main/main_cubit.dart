import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rada360/model/common/app_state_status.dart';
import 'package:rada360/model/response/common_data_response.dart';
import 'package:rada360/services/remote/network/dio/my_dio_exception.dart';
import 'package:rada360/services/remote/network/endpoints.dart';
import 'package:rada360/services/remote/repositories/api_repositories.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit({
    required this.apiRepositories,
  }) : super(MainState.initial());

  final ApiRepositories apiRepositories;

  getAccessToken() async {
    emit(state.copyWith(status: AppStateStatus.loading));
    final data = {'email': "developer@example.com", 'password': "123456"};
    final response = await apiRepositories.getAccessToken(
        endpoint: Endpoints.accessToken, data: data);
    if (response.isSuccessful() && response.response != null) {
      emit(state.copyWith(
          status: AppStateStatus.success, dataResponse: response.response));
    } else {
      emit(state.copyWith(
          status: AppStateStatus.error, exception: response.exception));
    }
  }
}
