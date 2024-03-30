part of 'categories_page_cubit.dart';

@freezed
class CategoriesPageState with _$CategoriesPageState {
  const factory CategoriesPageState.loading() = _Loading;
  const factory CategoriesPageState.loaded(
      {required List<Category> categories}) = _Loaded;
}
