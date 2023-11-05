import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/domain/repositories/task_repository.dart';

@singleton
class TaskDataSource implements TaskRepository {
  final FirebaseFirestore firebaseFirestore;

  TaskDataSource({required this.firebaseFirestore});
}
