import 'package:taski/domain/entities/task.dart';

abstract class TaskRepository {
  Stream<List<Task>> getUserTasks({required String userId});
  Future<Task> getTask({required String taskId});
  Future<String> addTask({required Task task});
  Future<void> editTask({required Task task});
  Future<void> deleteTask({required Task task});
  Future<void> changeIsNotificationSended({required Task task});
}
