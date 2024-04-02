import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taski/domain/entities/task.dart';

abstract class TaskRepository {
  Stream<QuerySnapshot<Object?>> getUserTasks({required String userId});
  Future<Task> getTask({required String taskId});
  Future<String> addTask({required Task task});
  Future<void> editTask({required Task task});
  Future<void> deleteTask({required Task task});
  Future<void> changeIsNotificationSended({required Task task});
}
