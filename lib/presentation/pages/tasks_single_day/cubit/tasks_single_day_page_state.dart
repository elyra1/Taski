part of 'tasks_single_day_page_cubit.dart';

@freezed
class TasksSingleDayPageState with _$TasksSingleDayPageState {
  const factory TasksSingleDayPageState.initial({
    required List<Task> tasks,
    required UserModel currentUser,
    required DateTime selectedDate,
    required int page,
  }) = _Initial;
}
