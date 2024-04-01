import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/data/firebase_collections.dart';
import 'package:taski/domain/entities/category.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/domain/repositories/category_repository.dart';

@Singleton(as: CategoryRepository)
class CategoriesDataSource implements CategoryRepository {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  CategoriesDataSource(this._firebaseFirestore, this._firebaseAuth);

  @override
  Future<void> addToCategory(
      {required String categoryId, required Task task}) async {
    final category = await _firebaseFirestore
        .collection(FirebaseCollections.categories)
        .doc(categoryId)
        .get();
    if (category.data() != null) {
      final initialCategory = Category.fromJson(category.data()!);
      final editedCategory = initialCategory.copyWith(
          tasks: List.from(initialCategory.tasks)..add(task.id));
      await _firebaseFirestore
          .collection(FirebaseCollections.categories)
          .doc(categoryId)
          .set(editedCategory.toJson());
    }
  }

  @override
  Future<void> createCategory({required Category category}) async {
    final json =
        category.copyWith(authorId: _firebaseAuth.currentUser!.uid).toJson();
    final newDocRef =
        _firebaseFirestore.collection(FirebaseCollections.categories).doc();
    json['id'] = newDocRef.id;
    await _firebaseFirestore.runTransaction(
        (transaction) async => transaction.set(newDocRef, json));
  }

  @override
  Future<void> deleteCategory({required String categoryId}) async {
    await _firebaseFirestore
        .collection(FirebaseCollections.categories)
        .doc(categoryId)
        .delete();
  }

  @override
  Future<void> deleteFromCategory(
      {required String categoryId, required String taskId}) async {
    final category = await _firebaseFirestore
        .collection(FirebaseCollections.categories)
        .doc(categoryId)
        .get();
    if (category.data() != null) {
      final initialCategory = Category.fromJson(category.data()!);
      final editedCategory = initialCategory.copyWith(
          tasks: List.from(initialCategory.tasks)
            ..removeWhere((id) => id == taskId));
      await _firebaseFirestore
          .collection(FirebaseCollections.categories)
          .doc(categoryId)
          .set(editedCategory.toJson());
    }
  }

  @override
  Future<List<Category>> getUserCategories() async {
    final qs = await _firebaseFirestore
        .collection(FirebaseCollections.categories)
        .get();
    return qs.docs
        .map((e) => Category.fromJson(e.data()))
        .where((element) => element.authorId == _firebaseAuth.currentUser!.uid)
        .toList();
  }

  @override
  Future<void> editCategory({required Category category}) async {
    await _firebaseFirestore
        .collection(FirebaseCollections.categories)
        .doc(category.id)
        .set(category.toJson());
  }

  @override
  Future<Category> getCategory({required String categoryId}) async {
    final doc = await _firebaseFirestore
        .collection(FirebaseCollections.categories)
        .doc(categoryId)
        .get();

    return Category.fromJson(doc.data()!);
  }
}
