import 'package:taski/domain/entities/task_entity.dart';

abstract class TaskRepository {
  ///Если endWith - null, возвращает список задач на день в startFrom, иначе просчитывает
  Future<List<TaskEntity>> getTasksForDay({
    String? userId,
    required DateTime day,
  });

  ///Возвращает задачи по дням на неделю(список списков задач), продумать алгоритм выбора промежутка недели
  Future<List<List<TaskEntity>>> getTasksForWeek({
    String? userId,
    required DateTime startFrom,
  });

  Future<void> getTask({required String taskId});
  Future<void> addTask({required TaskEntity task});
  Future<void> editTask({required String taskId});
  Future<void> deleteTask({required String taskId});

  ///Возвращает список задач из категории
  Future<List<TaskEntity>> getTasksByCategory({String? categoryId});
}
