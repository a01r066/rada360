part of 'survey_cubit.dart';

class SurveyState extends Equatable {
  const SurveyState({
    required this.status,
    this.exception,
  });

  final AppStateStatus status;
  final MyDioException? exception;

  @override
  List<Object> get props => [status];

  factory SurveyState.initial() {
    return const SurveyState(status: AppStateStatus.initial);
  }
}
