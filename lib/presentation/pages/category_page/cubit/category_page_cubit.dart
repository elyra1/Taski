import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/domain/repositories/task_repository.dart';

part 'category_page_state.dart';
part 'category_page_cubit.freezed.dart';

@injectable
class CategoryPageCubit extends Cubit<CategoryPageState> {
  final TaskRepository _taskRepository;
  CategoryPageCubit(this._taskRepository)
      : super(const CategoryPageState.loading());

  Future<void> init({required List<String> ids}) async {
    List<Task> tasks = [];
    for (String id in ids) {
      final task = await _taskRepository.getTask(taskId: id);
      tasks.add(task);
    }
    await Future.delayed(const Duration(milliseconds: 500));
    emit(CategoryPageState.loaded(tasks: tasks));
  }
}
