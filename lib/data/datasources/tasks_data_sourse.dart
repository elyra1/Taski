import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/data/firebase_collections.dart';
import 'package:taski/domain/entities/task_entity.dart';

@singleton
class TaskDataSource {
  final FirebaseFirestore firebaseFirestore;

  TaskDataSource({required this.firebaseFirestore});

  Future<void> addTask(TaskEntity task) async {
    final json = task.toJson();
    final newDocRef =
        firebaseFirestore.collection(FirebaseCollections.tasks).doc();
    json['id'] = newDocRef.id;
    await firebaseFirestore
        .runTransaction((transaction) async => transaction.set(newDocRef, json))
        .timeout(const Duration(seconds: 1));
  }

  Stream<QuerySnapshot> getUserTasks() async* {
    final stream =
        firebaseFirestore.collection(FirebaseCollections.tasks).snapshots();
    yield* stream;
  }
}
