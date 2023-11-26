import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taski/domain/entities/task.dart';

abstract class TaskRepository {
  ///test
  Stream<QuerySnapshot<Object?>> getUserTasks();

  ///Если endWith - null, возвращает список задач на день в startFrom, иначе просчитывает
  Future<List<Task>> getTasksForDay({
    String? userId,
    required DateTime day,
  });

  ///Возвращает задачи по дням на неделю(список списков задач), продумать алгоритм выбора промежутка недели
  Future<List<List<Task>>> getTasksForWeek({
    String? userId,
    required DateTime startFrom,
  });

  Future<void> getTask({required String taskId});
  Future<void> addTask({required Task task});
  Future<void> editTask({required String taskId});
  Future<void> deleteTask({required String taskId});

  ///Возвращает список задач из категории
  Future<List<Task>> getTasksByCategory({String? categoryId});
}
