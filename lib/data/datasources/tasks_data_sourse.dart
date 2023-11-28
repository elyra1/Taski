import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/data/firebase_collections.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/domain/repositories/task_repository.dart';

@Singleton(as: TaskRepository)
class TaskDataSource implements TaskRepository {
  final FirebaseFirestore _firebaseFirestore;

  TaskDataSource(this._firebaseFirestore);
  @override
  Future<void> addTask({required Task task}) async {
    final json = task.toJson();
    final newDocRef =
        _firebaseFirestore.collection(FirebaseCollections.tasks).doc();
    json['id'] = newDocRef.id;
    await _firebaseFirestore.runTransaction(
        (transaction) async => transaction.set(newDocRef, json));
  }

  @override
  Stream<QuerySnapshot> getUserTasks({required String userId}) async* {
    final stream = _firebaseFirestore
        .collection(FirebaseCollections.tasks)
        .where('authorId', isEqualTo: userId)
        .snapshots();
    yield* stream;
  }

  @override
  Future<void> deleteTask({required String taskId}) async {
    await _firebaseFirestore
        .collection(FirebaseCollections.tasks)
        .doc(taskId)
        .delete();
  }

  @override
  Future<void> editTask({required Task task}) async {
    await _firebaseFirestore
        .collection(FirebaseCollections.tasks)
        .doc(task.id)
        .set(task.toJson());
  }

  @override
  Future<void> getTask({required String taskId}) {
    // TODO: implement getTask
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getTasksByCategory({String? categoryId}) {
    // TODO: implement getTasksByCategory
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getTasksForDay({String? userId, required DateTime day}) {
    // TODO: implement getTasksForDay
    throw UnimplementedError();
  }

  @override
  Future<List<List<Task>>> getTasksForWeek(
      {String? userId, required DateTime startFrom}) {
    // TODO: implement getTasksForWeek
    throw UnimplementedError();
  }
}
