part of 'task_page_cubit.dart';

@freezed
class TaskPageState with _$TaskPageState {
  const factory TaskPageState.initial({
    @Default(false) bool isAuthor,
    @Default(false) bool isContributor,
    @Default(false) bool isSaving,
  }) = _Initial;
}
