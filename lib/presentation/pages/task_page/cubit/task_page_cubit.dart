import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/domain/entities/category.dart';
import 'package:taski/domain/repositories/category_repository.dart';

part 'task_page_state.dart';
part 'task_page_cubit.freezed.dart';

@injectable
class TaskPageCubit extends Cubit<TaskPageState> {
  final CategoryRepository _categoryRepository;
  TaskPageCubit(this._categoryRepository)
      : super(const TaskPageState.initial());

  Future<Category> getCategory(String categoryId) async {
    final category =
        await _categoryRepository.getCategory(categoryId: categoryId);
    await Future.delayed(const Duration(seconds: 1));
    return category;
  }
}
