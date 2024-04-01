import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/domain/entities/category.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/domain/repositories/auth_repository.dart';
import 'package:taski/domain/repositories/category_repository.dart';
import 'package:taski/domain/repositories/task_repository.dart';
part 'create_task_page_cubit.freezed.dart';

part 'create_task_page_state.dart';

@injectable
class CreateTaskCubit extends Cubit<CreateTask> {
  final TaskRepository _taskRepository;
  final AuthRepository _authRepository;
  final CategoryRepository _categoryRepository;
  CreateTaskCubit(
    this._taskRepository,
    this._authRepository,
    this._categoryRepository,
  ) : super(const CreateTask.initial());

  Future<String?> addTask(Task task) async {
    try {
      final user = await _authRepository.getUser();
      final newTaskId =
          await _taskRepository.addTask(task: task.copyWith(authorId: user.id));

      if (task.category != null) {
        await _categoryRepository.addToCategory(
          categoryId: task.category!,
          task: task.copyWith(id: newTaskId),
        );
      }
      return null;
    } on FirebaseException catch (e, _) {
      return e.message;
    }
  }

  Future<String?> editTask(Task task) async {
    try {
      final oldTask = await _taskRepository.getTask(taskId: task.id);
      await _taskRepository.editTask(task: task);

      if (oldTask.category != task.category) {
        if (oldTask.category != null) {
          await _categoryRepository.deleteFromCategory(
            categoryId: oldTask.category!,
            taskId: task.id,
          );
        }
        if (task.category != null) {
          await _categoryRepository.addToCategory(
            categoryId: task.category!,
            task: task,
          );
        }
      }
      return null;
    } on FirebaseException catch (e, _) {
      return e.message;
    }
  }

  Future<String?> deleteTask(Task task) async {
    try {
      await _taskRepository.deleteTask(task: task);
      if (task.category != null) {
        _categoryRepository.deleteFromCategory(
          categoryId: task.category!,
          taskId: task.id,
        );
      }
      return null;
    } on FirebaseException catch (e, _) {
      return e.message;
    }
  }

  Future<List<Category>> getCategories() async {
    await Future.delayed(const Duration(seconds: 1));
    return await _categoryRepository.getUserCategories();
  }
}
