import 'package:taski/domain/entities/category.dart';

abstract class CategoryRepository {
  ///при удалении категории пройтись по всем задачам из категории с editTask, и сделать null категорию.
  Future<void> deleteCategory({required String categoryId});
  Future<void> createCategory({required Category category});

  ///если при создании/изменении выбрать категорию или при удалении, обновить категорию(убрать/добавить задачу).
  Future<void> addToCategory(
      {required String categoryId, required String taskId});
  Future<void> deleteFromCategory(
      {required String categoryId, required String taskId});
}
