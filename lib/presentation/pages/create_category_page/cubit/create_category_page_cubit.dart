import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/domain/entities/category.dart';
import 'package:taski/domain/repositories/auth_repository.dart';
import 'package:taski/domain/repositories/category_repository.dart';

part 'create_category_page_state.dart';
part 'create_category_page_cubit.freezed.dart';

@injectable
class CreateCategoryPageCubit extends Cubit<CreateCategoryPageState> {
  final CategoryRepository _categoryRepository;
  final AuthRepository _authRepository;
  CreateCategoryPageCubit(this._categoryRepository, this._authRepository)
      : super(const CreateCategoryPageState.initial());

  Future<String?> addCategory(Category category) async {
    try {
      final user = await _authRepository.getUser();
      await _categoryRepository.createCategory(
          category: category.copyWith(authorId: user.id));
      return null;
    } on FirebaseException catch (e, _) {
      return e.message;
    }
  }

  Future<String?> editCategory(Category category) async {
    try {
      await _categoryRepository.editCategory(category: category);
      return null;
    } on FirebaseException catch (e, _) {
      return e.message;
    }
  }
}
