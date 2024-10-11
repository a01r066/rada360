import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rada360/model/common/app_state_status.dart';
import 'package:rada360/services/remote/network/dio/my_dio_exception.dart';

part 'survey_state.dart';

class SurveyCubit extends Cubit<SurveyState> {
  SurveyCubit() : super(SurveyState.initial());
}
