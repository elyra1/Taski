part of 'create_task_page_cubit.dart';

@freezed
abstract class CreateTaskState with _$CreateTaskState {
  const factory CreateTaskState.loading() = Loading;
  const factory CreateTaskState.loaded({
    required UserModel author,
    required List<UserModel> contributors,
    required List<Category> categories,
  }) = Loaded;
  const factory CreateTaskState.saving() = Saving;
}
