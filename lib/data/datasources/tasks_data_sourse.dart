import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
class TaskDataSource {
  final FirebaseFirestore firebaseFirestore;

  TaskDataSource({required this.firebaseFirestore});
}
