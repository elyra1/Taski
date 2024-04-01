import 'package:taski/domain/entities/category.dart';
import 'package:taski/domain/entities/task.dart';

abstract class CategoryRepository {
  ///при удалении категории пройтись по всем задачам из категории с editTask, и сделать null категорию.
  Future<void> deleteCategory({required String categoryId});
  Future<void> createCategory({required Category category});
  Future<void> editCategory({required Category category});

  ///если при создании/изменении выбрать категорию или при удалении, обновить категорию(убрать/добавить задачу).
  Future<void> addToCategory({required String categoryId, required Task task});

  Future<void> deleteFromCategory(
      {required String categoryId, required String taskId});

  Future<List<Category>> getUserCategories();
  Future<Category> getCategory({required String categoryId});
}
