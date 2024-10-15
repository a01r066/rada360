import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rada360/model/common/app_state_status.dart';
import 'package:rada360/services/remote/network/dio/my_dio_exception.dart';

part 'home_controller_state.dart';

class HomeControllerCubit extends Cubit<HomeControllerState> {
  HomeControllerCubit() : super(HomeControllerState.initial());
}
