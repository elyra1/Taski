import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/domain/repositories/auth_repository.dart';
import 'package:taski/domain/repositories/task_repository.dart';
part 'create_task_page_cubit.freezed.dart';

part 'create_task_page_state.dart';

@injectable
class CreateTaskCubit extends Cubit<CreateTask> {
  final TaskRepository _taskRepository;
  final AuthRepository _authRepository;
  CreateTaskCubit(this._taskRepository, this._authRepository)
      : super(const CreateTask.initial());

  Future<String?> addTask(Task task) async {
    try {
      final user = await _authRepository.getUser();
      await _taskRepository.addTask(task: task.copyWith(authorId: user.id));
      return null;
    } on FirebaseException catch (e, _) {
      return e.message;
    }
  }
}
