import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/domain/entities/category.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/domain/entities/user_model.dart';
import 'package:taski/domain/repositories/category_repository.dart';
import 'package:taski/domain/repositories/task_repository.dart';
import 'package:taski/domain/repositories/user_repository.dart';

part 'task_page_state.dart';
part 'task_page_cubit.freezed.dart';

@injectable
class TaskPageCubit extends Cubit<TaskPageState> {
  final CategoryRepository _categoryRepository;
  final UserRepository _userRepository;
  final TaskRepository _taskRepository;
  TaskPageCubit(
      this._categoryRepository, this._userRepository, this._taskRepository)
      : super(const TaskPageState.initial(isAuthor: false));

  Future<Category> getCategory(String categoryId) async {
    final category =
        await _categoryRepository.getCategory(categoryId: categoryId);
    await Future.delayed(const Duration(seconds: 1));
    return category;
  }

  Future<List<UserModel>> getContributors(List<String> contributorsIds) async {
    List<UserModel> contributors = [];
    for (String userId in contributorsIds) {
      final user = await _userRepository.getUser(userId: userId);
      contributors.add(user);
    }
    await Future.delayed(const Duration(seconds: 1));
    return contributors;
  }

  Future<void> getUserInfo(Task task) async {
    final currentUser = await _userRepository.getUser();
    final isContributor = currentUser.id != task.authorId &&
        task.contributors.contains(currentUser.id);

    emit(
      state.copyWith(
        isAuthor: currentUser.id == task.authorId,
        isContributor: isContributor,
      ),
    );
  }

  Future<void> leaveFromTask(Task task) async {
    emit(state.copyWith(isSaving: true));
    final currentUser = await _userRepository.getUser();
    final contributors = List<String>.from(task.contributors)
      ..remove(currentUser.id);
    await _taskRepository.editTask(
      task: task.copyWith(contributors: contributors),
    );
  }
}
