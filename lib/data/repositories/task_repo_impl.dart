import 'package:taski/data/datasources/tasks_data_sourse.dart';
import 'package:taski/domain/entities/task_entity.dart';
import 'package:taski/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskDataSource _taskDataSource;

  TaskRepositoryImpl(this._taskDataSource);

  @override
  Future<void> createTask({required TaskEntity task}) {
    // TODO: implement createTask
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTask({required String taskId}) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<void> editTask({required String taskId}) {
    // TODO: implement editTask
    throw UnimplementedError();
  }

  @override
  Future<void> getTask({required String taskId}) {
    // TODO: implement getTask
    throw UnimplementedError();
  }

  @override
  Future<List<TaskEntity>> getTasksByCategory({String? categoryId}) {
    // TODO: implement getTasksByCategory
    throw UnimplementedError();
  }

  @override
  Future<List<TaskEntity>> getTasksForDay(
      {String? userId, required DateTime day}) {
    // TODO: implement getTasksForDay
    throw UnimplementedError();
  }

  @override
  Future<List<List<TaskEntity>>> getTasksForWeek(
      {String? userId, required DateTime startFrom}) {
    // TODO: implement getTasksForWeek
    throw UnimplementedError();
  }
}
