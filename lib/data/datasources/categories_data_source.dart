import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/data/firebase_collections.dart';
import 'package:taski/domain/entities/category.dart';
import 'package:taski/domain/repositories/category_repository.dart';

@Singleton(as: CategoryRepository)
class CategoriesDataSource implements CategoryRepository {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  CategoriesDataSource(this._firebaseFirestore, this._firebaseAuth);

  @override
  Future<void> addToCategory(
      {required String categoryId, required String taskId}) {
    // TODO: implement addToCategory
    throw UnimplementedError();
  }

  @override
  Future<void> createCategory({required Category category}) async {
    await _firebaseFirestore.collection(FirebaseCollections.categories).add(
        category.copyWith(authorId: _firebaseAuth.currentUser!.uid).toJson());
  }

  @override
  Future<void> deleteCategory({required String categoryId}) {
    // TODO: implement deleteCategory
    throw UnimplementedError();
  }

  @override
  Future<void> deleteFromCategory(
      {required String categoryId, required String taskId}) {
    // TODO: implement deleteFromCategory
    throw UnimplementedError();
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
}
