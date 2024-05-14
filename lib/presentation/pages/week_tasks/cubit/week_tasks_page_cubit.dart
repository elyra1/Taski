import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/domain/entities/user_model.dart';
import 'package:taski/domain/repositories/user_repository.dart';
import 'package:taski/domain/repositories/task_repository.dart';
import 'package:taski/presentation/widgets/task_grids/week_markup.dart/week_task_grid_helper.dart';

part 'week_tasks_page_state.dart';
part 'week_tasks_page_cubit.freezed.dart';

@injectable
class WeekTasksPageCubit extends Cubit<WeekTasksPageState> {
  final TaskRepository _taskRepository;
  final UserRepository _authRepository;
  WeekTasksPageCubit(this._taskRepository, this._authRepository)
      : super(
          WeekTasksPageState.initial(
            tasks: [],
            currentUser: UserModel.getEmpty(),
            selectedWeek: DateTime.now(),
            page: 0,
          ),
        );

  Future<void> init({String? userId}) async {
    final currentUser = await _authRepository.getUser();
    emit(state.copyWith(currentUser: currentUser));
    await getTasks(userId: userId ?? currentUser.id);
  }

  Future<void> getTasks({String? userId}) async {
    String uid;
    if (userId == null) {
      final user = await _authRepository.getUser();
      uid = user.id;
    } else {
      uid = userId;
    }
    final taskStream = _taskRepository.getUserTasks(userId: uid);
    await taskStream.forEach((element) {
      emit(state.copyWith(tasks: element));
    });
  }

  Future<void> editTask(Task task) async {
    await _taskRepository.editTask(
      task: task.copyWith(notificationSended: false),
    );
  }

  Future<void> onPageChanged({required int value, String? userId}) async {
    final newWeek = value - state.page > 0
        ? state.selectedWeek.add(const Duration(days: 7))
        : state.selectedWeek.subtract(const Duration(days: 7));
    emit(state.copyWith(page: value, selectedWeek: newWeek));
    await getTasks(userId: userId ?? state.currentUser.id);
  }

  List<Task> getTasksThisWeek() {
    final weekDates = WeekTaskGridHelper.getWeekDates(state.selectedWeek)
        .map((e) => getDateOnly(e)); // Получаем список дат текущей недели

    return state.tasks.where((task) {
      return weekDates.contains(getDateOnly(task.startTime.toDate()));
    }).toList();
  }

  DateTime getDateOnly(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }
}
