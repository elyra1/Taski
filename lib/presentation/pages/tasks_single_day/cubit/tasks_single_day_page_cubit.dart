import 'dart:async';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/domain/entities/user_model.dart';
import 'package:taski/domain/repositories/user_repository.dart';
import 'package:taski/domain/repositories/task_repository.dart';

part 'tasks_single_day_page_state.dart';
part 'tasks_single_day_page_cubit.freezed.dart';

@injectable
class TasksSingleDayPageCubit extends Cubit<TasksSingleDayPageState> {
  final TaskRepository _taskRepository;
  final UserRepository _authRepository;
  TasksSingleDayPageCubit(this._taskRepository, this._authRepository)
      : super(
          TasksSingleDayPageState.initial(
            tasks: [],
            currentUser: UserModel.getEmpty(),
            page: 0,
            selectedDate: DateTime.now(),
          ),
        );

  Future<void> init({String? userId}) async {
    final currentUser = await _authRepository.getUser();
    emit(state.copyWith(currentUser: currentUser));
    await getTasks(userId: userId ?? currentUser.id);
  }

  Future<void> getTasks({required String userId}) async {
    final taskStream = _taskRepository.getUserTasks(userId: userId).map(
          (event) => event.where(
            (element) {
              return element.startTime.toDate().isSameDate(state.selectedDate);
            },
          ).toList(),
        );
    await taskStream.forEach(
      (element) {
        if (!isClosed) {
          emit(state.copyWith(tasks: element));
        }
      },
    );
  }

  Future<void> onPageChanged({required int value, String? userId}) async {
    final newDate = value - state.page > 0
        ? state.selectedDate.add(const Duration(days: 1))
        : state.selectedDate.subtract(const Duration(days: 1));
    emit(state.copyWith(page: value, selectedDate: newDate));
    await getTasks(userId: userId ?? state.currentUser.id);
  }

  Future<void> editTask(Task task) async {
    await _taskRepository.editTask(
        task: task.copyWith(notificationSended: false));
  }
}
