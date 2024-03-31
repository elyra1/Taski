part of 'category_page_cubit.dart';

@freezed
class CategoryPageState with _$CategoryPageState {
  const factory CategoryPageState.loading() = _Loading;
  const factory CategoryPageState.loaded({required List<Task> tasks}) = _Loaded;
}
