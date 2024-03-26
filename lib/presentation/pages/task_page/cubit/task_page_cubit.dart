import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_page_state.dart';
part 'task_page_cubit.freezed.dart';

class TaskPageCubit extends Cubit<TaskPageState> {
  TaskPageCubit() : super(TaskPageState.initial());
}
