import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/domain/repositories/user_repository.dart';
import 'package:taski/domain/repositories/task_repository.dart';

part 'tasks_month_page_state.dart';
part 'tasks_month_page_cubit.freezed.dart';

@injectable
class TasksMonthPageCubit extends Cubit<TasksMonthPageState> {
  final TaskRepository _taskRepository;
  final UserRepository _authRepository;
  TasksMonthPageCubit(
    this._taskRepository,
    this._authRepository,
  ) : super(const TasksMonthPageState.initial(tasks: []));

  Future<void> getTasks({String? userId, DateTime? dayOfTasks}) async {
    String uid;
    if (userId == null) {
      final user = await _authRepository.getUser(userId: userId);
      uid = user.id;
    } else {
      uid = userId;
    }
    final taskStream =
        _taskRepository.getUserTasks(userId: uid).map((event) => event.where(
              (element) {
                return element.startTime
                    .toDate()
                    .isSameDate(dayOfTasks ?? DateTime.now());
              },
            ).toList()
              ..sort((a, b) => a.startTime.compareTo(b.startTime)));
    await taskStream.forEach((element) {
      emit(state.copyWith(tasks: element));
    });
  }
}
