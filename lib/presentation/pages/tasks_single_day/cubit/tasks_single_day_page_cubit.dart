import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/domain/repositories/auth_repository.dart';
import 'package:taski/domain/repositories/task_repository.dart';

part 'tasks_single_day_page_state.dart';
part 'tasks_single_day_page_cubit.freezed.dart';

@injectable
class TasksSingleDayPageCubit extends Cubit<TasksSingleDayPageState> {
  final TaskRepository _taskRepository;
  final AuthRepository _authRepository;
  TasksSingleDayPageCubit(this._taskRepository, this._authRepository)
      : super(TasksSingleDayPageState.initial());

  Stream<List<Task>> getTasks({String? userId, DateTime? dayOfTasks}) async* {
    String uid;
    if (userId == null) {
      final user = await _authRepository.getCurrentUser();
      uid = user.id;
    } else {
      uid = userId;
    }
    final snapStream = _taskRepository.getUserTasks(userId: uid);
    final taskStream = snapStream.map((event) => event.docs
            .map((e) => Task.fromJson(e.data()! as Map<String, dynamic>))
            .where((element) {
          return element.startTime
              .toDate()
              .isSameDate(dayOfTasks ?? DateTime.now());
        }).toList());
    yield* taskStream;
  }

  Future<void> addTask(Task task) async {
    await _taskRepository.addTask(task: task);
  }

  Future<void> editTask(Task task) async {
    await _taskRepository.editTask(task: task);
  }

  Future<void> deleteTask(Task task) async {
    await _taskRepository.deleteTask(taskId: task.id);
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
  }
}
