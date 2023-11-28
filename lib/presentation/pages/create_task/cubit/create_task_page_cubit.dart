import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
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
}
