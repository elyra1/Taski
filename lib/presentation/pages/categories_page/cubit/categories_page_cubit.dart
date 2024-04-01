import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/domain/entities/category.dart';
import 'package:taski/domain/repositories/category_repository.dart';
part 'categories_page_state.dart';
part 'categories_page_cubit.freezed.dart';

@injectable
class CategoriesPageCubit extends Cubit<CategoriesPageState> {
  final CategoryRepository _categoryRepository;
  CategoriesPageCubit(this._categoryRepository)
      : super(const CategoriesPageState.loading());

  Future<void> init() async {
    emit(const CategoriesPageState.loading());
    final categories = await _categoryRepository.getUserCategories();
    await Future.delayed(const Duration(milliseconds: 500));
    emit(
      CategoriesPageState.loaded(
        categories: categories,
      ),
    );
  }
}
