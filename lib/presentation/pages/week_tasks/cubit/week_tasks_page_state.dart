part of 'week_tasks_page_cubit.dart';

@freezed
class WeekTasksPageState with _$WeekTasksPageState {
  const factory WeekTasksPageState.initial({
    required List<Task> tasks,
    required UserModel currentUser,
    required DateTime selectedWeek,
    required int page,
  }) = _Initial;
}
