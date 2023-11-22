import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/domain/repositories/task_repository.dart';
part 'example_page_cubit.freezed.dart';

part 'example_page_state.dart';

@injectable
class ExamplePageCubit extends Cubit<ExamplePage> {
  final TaskRepository _taskRepository;
  ExamplePageCubit(this._taskRepository) : super(const ExamplePage.initial());

  ///test
  Stream<List<Task>> getTasks() async* {
    final snapStream = _taskRepository.getUserTasks();
    final taskStream = snapStream.map((event) => event.docs
        .map((e) => Task.fromJson(e.data()! as Map<String, dynamic>))
        .toList());
    yield* taskStream;
  }

  Future<void> addTask(Task task) async {
    await _taskRepository.addTask(task: task);
  }

  Future<void> deleteTask(Task task) async {
    await _taskRepository.deleteTask(taskId: task.id);
  }
}
