part of 'create_task_page_cubit.dart';

@freezed
abstract class CreateTaskState with _$CreateTaskState {
  const factory CreateTaskState.initial() = _Initial;
  const factory CreateTaskState.saving() = _Saving;
}
