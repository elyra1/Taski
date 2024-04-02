import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/domain/entities/category.dart';
import 'package:taski/domain/repositories/auth_repository.dart';
import 'package:taski/domain/repositories/category_repository.dart';
import 'package:taski/domain/repositories/task_repository.dart';

part 'create_category_page_state.dart';
part 'create_category_page_cubit.freezed.dart';

@injectable
class CreateCategoryPageCubit extends Cubit<CreateCategoryPageState> {
  final CategoryRepository _categoryRepository;
  final AuthRepository _authRepository;
  final TaskRepository _taskRepository;
  CreateCategoryPageCubit(
      this._categoryRepository, this._authRepository, this._taskRepository)
      : super(const CreateCategoryPageState.initial());

  Future<String?> addCategory(Category category) async {
    try {
      final user = await _authRepository.getUser();
      await _categoryRepository.createCategory(
          category: category.copyWith(authorId: user.id));
      return null;
    } on FirebaseException catch (e, _) {
      return e.message;
    }
  }

  Future<String?> editCategory(Category category) async {
    try {
      await _categoryRepository.editCategory(category: category);
      return null;
    } on FirebaseException catch (e, _) {
      return e.message;
    }
  }

  Future<String?> deleteCategory(Category category) async {
    try {
      for (String taskId in category.tasks) {
        await _categoryRepository.deleteFromCategory(
          categoryId: category.id,
          taskId: taskId,
        );

        final task = await _taskRepository.getTask(taskId: taskId);
        await _taskRepository.editTask(task: task.copyWith(category: null));
      }
      await _categoryRepository.deleteCategory(categoryId: category.id);
      return null;
    } on FirebaseException catch (e, _) {
      return e.message;
    }
  }
}
