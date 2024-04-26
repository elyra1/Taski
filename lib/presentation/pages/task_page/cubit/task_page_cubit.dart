import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/domain/entities/category.dart';
import 'package:taski/domain/entities/user_model.dart';
import 'package:taski/domain/repositories/category_repository.dart';
import 'package:taski/domain/repositories/user_repository.dart';

part 'task_page_state.dart';
part 'task_page_cubit.freezed.dart';

@injectable
class TaskPageCubit extends Cubit<TaskPageState> {
  final CategoryRepository _categoryRepository;
  final UserRepository _userRepository;
  TaskPageCubit(this._categoryRepository, this._userRepository)
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

  Future<void> isAuthor(String taskAuthorId) async {
    final currentUser = await _userRepository.getUser();
    emit(state.copyWith(isAuthor: currentUser.id == taskAuthorId));
  }
}
