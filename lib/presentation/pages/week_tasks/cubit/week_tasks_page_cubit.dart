import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/domain/repositories/auth_repository.dart';
import 'package:taski/domain/repositories/task_repository.dart';
import 'package:taski/presentation/widgets/task_grids/week_markup.dart/week_task_grid_helper.dart';

part 'week_tasks_page_state.dart';
part 'week_tasks_page_cubit.freezed.dart';

@injectable
class WeekTasksPageCubit extends Cubit<WeekTasksPageState> {
  final TaskRepository _taskRepository;
  final AuthRepository _authRepository;
  WeekTasksPageCubit(this._taskRepository, this._authRepository)
      : super(const WeekTasksPageState.initial());

  Stream<List<Task>> getTasks({String? userId}) async* {
    String uid;
    if (userId == null) {
      final user = await _authRepository.getUser();
      uid = user.id;
    } else {
      uid = userId;
    }
    final snapStream = _taskRepository.getUserTasks(userId: uid);
    final taskStream = snapStream.map((event) => event.docs
        .map((e) => Task.fromJson(e.data()! as Map<String, dynamic>))
        .toList());
    yield* taskStream;
  }

  Future<void> editTask(Task task) async {
    await _taskRepository.editTask(
      task: task.copyWith(notificationSended: false),
    );
  }

  List<Task> getTasksThisWeek(List<Task> tasks, DateTime currentDate) {
    final weekDates = WeekTaskGridHelper.getWeekDates(currentDate)
        .map((e) => getDateOnly(e)); // Получаем список дат текущей недели

    return tasks.where((task) {
      return weekDates.contains(getDateOnly(task.startTime.toDate()));
    }).toList();
  }

  DateTime getDateOnly(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }
}
