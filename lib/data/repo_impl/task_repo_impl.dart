import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/data/firebase_collections.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/domain/repositories/task_repository.dart';

@Singleton(as: TaskRepository)
class TaskRepoImpl implements TaskRepository {
  final FirebaseFirestore _firebaseFirestore;

  TaskRepoImpl(this._firebaseFirestore);
  @override
  Future<String> addTask({required Task task}) async {
    final json = task.toJson();
    final newDocRef =
        _firebaseFirestore.collection(FirebaseCollections.tasks).doc();
    json['id'] = newDocRef.id;
    await _firebaseFirestore.runTransaction(
        (transaction) async => transaction.set(newDocRef, json));

    return newDocRef.id;
  }

  @override
  Stream<List<Task>> getUserTasks({required String userId}) async* {
    final stream = _firebaseFirestore
        .collection(FirebaseCollections.tasks)
        .where('contributors', arrayContains: userId)
        .snapshots();
    yield* stream.map(
        (event) => event.docs.map((e) => Task.fromJson(e.data())).toList());
  }

  @override
  Future<void> deleteTask({required Task task}) async {
    await _firebaseFirestore
        .collection(FirebaseCollections.tasks)
        .doc(task.id)
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
  Future<Task> getTask({required String taskId}) async {
    final doc = await _firebaseFirestore
        .collection(FirebaseCollections.tasks)
        .doc(taskId)
        .get();
    return Task.fromJson(doc.data()!);
  }

  @override
  Future<void> changeIsNotificationSended({required Task task}) async =>
      await editTask(task: task.copyWith(notificationSended: false));
}
