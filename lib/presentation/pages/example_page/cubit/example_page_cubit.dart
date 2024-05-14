import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/domain/repositories/user_repository.dart';
import 'package:taski/domain/repositories/task_repository.dart';
part 'example_page_cubit.freezed.dart';

part 'example_page_state.dart';

@injectable
class ExamplePageCubit extends Cubit<ExamplePage> {
  final TaskRepository _taskRepository;
  final UserRepository _authRepository;
  ExamplePageCubit(this._taskRepository, this._authRepository)
      : super(const ExamplePage.initial());

  Future<void> addTask(Task task) async {
    await _taskRepository.addTask(task: task);
  }

  Future<void> deleteTask(Task task) async {
    await _taskRepository.deleteTask(task: task);
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
  }
}
